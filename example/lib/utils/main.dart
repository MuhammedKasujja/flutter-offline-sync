import 'dart:isolate';
import 'package:example/data/models/comment_model.dart';
import 'package:example/data/utils.dart';
import 'package:example/objectbox.g.dart';
import 'package:faker/faker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Modified ObjectBox class to manage store in a dedicated isolate
class ObjectBox {
  late final SendPort _databaseSendPort;
  static final ObjectBox _singleton = ObjectBox._internal();
  static bool _initialized = false;

  ObjectBox._internal();

  static Future<void> create({required String databaseName}) async {
    assert(databaseName.isNotEmpty, 'Database name must be provided');
    if (!_initialized) {
      final receivePort = ReceivePort();
      final path = await _getDBPath(databaseName);
      await Isolate.spawn(_databaseIsolate, [path, receivePort.sendPort]);
      _singleton._databaseSendPort = await receivePort.first as SendPort;
      _initialized = true;
      receivePort.close();
    }
  }

  static ObjectBox get instance {
    if (!_initialized) {
      throw Exception('ObjectBox has not been initialized. Call create() first');
    }
    return _singleton;
  }

  static ObjectBox get I => instance;

  static Future<String> _getDBPath(String databaseName) async {
    final docsDir = await getApplicationDocumentsDirectory();
    return p.join(docsDir.path, databaseName);
  }

  // Method to insert data via the database isolate
  Future<void> insertComments(List<CommentModel> comments) async {
    final replyPort = ReceivePort();
    _databaseSendPort.send(DatabaseRequest(replyPort.sendPort, comments));
    final result = await replyPort.first;
    replyPort.close();
    if (result is String && result.startsWith('Error')) {
      throw Exception(result);
    }
  }

  // Method to close the store and terminate the isolate
  Future<void> close() async {
    final replyPort = ReceivePort();
    _databaseSendPort.send(DatabaseRequest(replyPort.sendPort, [], operation: 'close'));
    await replyPort.first;
    replyPort.close();
    _initialized = false;
  }
}

// Message class for isolate communication
class DatabaseRequest {
  final SendPort replyPort;
  final List<CommentModel> comments;
  final String operation;

  DatabaseRequest(this.replyPort, this.comments, {this.operation = 'insert'});
}

// Database isolate function
void _databaseIsolate(List args) async {
  final String dbDir = args[0];
  final SendPort mainSendPort = args[1];

  final store = Store(getObjectBoxModel(), directory: dbDir);
  final box = store.box<CommentModel>();
  mainSendPort.send(ReceivePort().sendPort); // Send the database isolate's SendPort

  await for (final message in ReceivePort()) {
    if (message is DatabaseRequest) {
      try {
        if (message.operation == 'insert') {
          store.runInTransaction(TxMode.write, () => box.putMany(message.comments));
          message.replyPort.send(true);
        } else if (message.operation == 'close') {
          store.close();
          message.replyPort.send(true);
          break; // Exit the isolate
        }
      } catch (e) {
        message.replyPort.send('Error: $e');
      }
    }
  }
}

// Function to insert large JSON data
Future<void> insertLargeDataInIsolateSpawn(List<Map<String, dynamic>> commentsData) async {
  final receivePort = ReceivePort();

  // Spawn an isolate to parse JSON data
  await Isolate.spawn(_backgroundParse, [commentsData, receivePort.sendPort]);

  // Wait for parsed CommentModel objects
  final result = await receivePort.first as DatabaseRequest;
  receivePort.close();

  // Send the parsed data to the database isolate
  await ObjectBox.instance.insertComments(result.comments);

  result.replyPort.send(true); // Signal completion
}

// Isolate function to parse JSON data
void _backgroundParse(List args) {
  final List<Map<String, dynamic>> commentsData = args[0];
  final SendPort sendPort = args[1];

  final comments = commentsData.map((m) => CommentModel.fromJson(m)).toList();
  sendPort.send(DatabaseRequest(ReceivePort().sendPort, comments));
}

// Example usage
Future<void> main() async {
  // Initialize ObjectBox with database isolate
  await ObjectBox.create(databaseName: 'offline_sync_example');

  // Generate sample data
  final comments = List.generate(
    5,
    (_) => CommentModel(
      content: faker.lorem.random.string(200),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      uuid: getRandomString(24),
      isSynced: false,
    ).toJson(),
  );

  try {
    await insertLargeDataInIsolateSpawn(comments);
    print('Data inserted successfully');
  } catch (e) {
    print('Failed to insert data: $e');
  }

  // Close the store when done (e.g., when app is terminated)
  await ObjectBox.instance.close();
}