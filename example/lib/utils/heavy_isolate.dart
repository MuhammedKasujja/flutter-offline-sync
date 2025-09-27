import 'dart:async';
import 'dart:isolate';
import 'package:example/data/models/comment_model.dart';
import 'package:example/data/objectbox.dart';
import 'package:example/data/utils.dart';
import 'package:example/objectbox.g.dart';
import 'package:faker/faker.dart';

/// Entry point for spawned isolate
/// message: [dbDir(String), mainSendPort(SendPort)]
void objectBoxWorker(List initial) async {
  final String dbDir = initial[0] as String;
  final SendPort mainSendPort = initial[1] as SendPort;

  // The worker's ReceivePort for commands
  final ReceivePort workerReceive = ReceivePort();

  // Send the worker's SendPort back to main isolate for communication
  mainSendPort.send(workerReceive.sendPort);

  // Open a Store inside this worker isolate ONLY
  final store = Store(getObjectBoxModel(), directory: dbDir);
  final box = store.box<CommentModel>();

  // Listen for messages (chunks / close commands)
  await for (final dynamic msg in workerReceive) {
    try {
      if (msg is Map && msg['type'] == 'insertChunk') {
        // Expect data as List<Map<String, dynamic>>
        final List<dynamic> rawChunk = msg['data'] as List<dynamic>;
        final chunk = rawChunk.cast<Map<String, dynamic>>();

        // Convert to models inside the isolate
        final items = chunk.map((m) => CommentModel.fromJson(m)).toList();

        // Insert inside a transaction for speed
        store.runInTransaction(TxMode.write, () {
          box.putMany(items);
        });

        // Optionally send a progress message back
        mainSendPort.send({
          'type': 'chunkInserted',
          'inserted': items.length,
          'meta': msg['meta'],
        });
      } else if (msg is Map && msg['type'] == 'close') {
        // Close store and break loop
        store.close();
        mainSendPort.send({'type': 'closed'});
        workerReceive.close();
        break;
      } else {
        // Unknown message - ignore or send back an error
        mainSendPort.send({
          'type': 'error',
          'message': 'unknown message',
          'payload': msg,
        });
      }
    } catch (e, st) {
      mainSendPort.send({
        'type': 'error',
        'message': e.toString(),
        'stack': st.toString(),
      });
    }
  }
}

class ObjectBoxWorkerManager {
  Isolate? _isolate;
  SendPort? _workerSendPort;
  final ReceivePort _mainReceivePort = ReceivePort();

  /// Stream of progress messages from worker
  Stream get messages => _mainReceivePort.asBroadcastStream();

  Future<void> start(String dbDir) async {
    // Spawn the worker isolate and pass mainSendPort so worker can reply
    _isolate = await Isolate.spawn(objectBoxWorker, [
      dbDir,
      _mainReceivePort.sendPort,
    ]);

    // Wait for worker to send its SendPort
    final workerSendPort =
        await _mainReceivePort.firstWhere((m) => m is SendPort) as SendPort;
    _workerSendPort = workerSendPort;
  }

  /// Send a chunk of maps to the worker
  void sendChunk(
    List<Map<String, dynamic>> chunk, {
    Map<String, dynamic>? meta,
  }) {
    if (_workerSendPort == null) {
      throw StateError('Worker not started');
    }
    _workerSendPort!.send({'type': 'insertChunk', 'data': chunk, 'meta': meta});
  }

  /// Request worker to close and clean up
  Future<void> stop() async {
    if (_workerSendPort == null) return;
    final completer = Completer<void>();
    final tmp = ReceivePort();
    final sub = tmp.listen((m) {
      if (m is Map && m['type'] == 'closed') {
        completer.complete();
      }
    });

    // Tell worker to close, giving a reply port if you want
    _workerSendPort!.send({'type': 'close', 'reply': tmp.sendPort});

    await completer.future.timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        // force kill if worker didn't respond
        _isolate?.kill(priority: Isolate.immediate);
      },
    );

    await sub.cancel();
    tmp.close();
    _mainReceivePort.close();
    _isolate = null;
    _workerSendPort = null;
  }
}

Future saveDataIsolate() async {
  final manager = ObjectBoxWorkerManager();

  await manager.start(ObjectBox.instance.store.directoryPath);

  // Listen to progress
  manager.messages.listen((msg) {
    print('worker message: $msg');
  });

  // Prepare chunks (maps)
  final comments = List.generate(
    5,
    (_) => CommentModel(
      content: faker.lorem.random.string(200),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      uuid: getRandomString(24),
      isSynced: false,
    ),
  );
  final serialized = comments.map((c) => c.toJson()).toList();

  // chunk size example
  const chunkSize = 5;
  for (var i = 0; i < serialized.length; i += chunkSize) {
    final chunk = serialized.skip(i).take(chunkSize).toList();
    manager.sendChunk(chunk, meta: {'chunkIndex': i ~/ chunkSize});
  }

  // When done
  await manager.stop();
}
