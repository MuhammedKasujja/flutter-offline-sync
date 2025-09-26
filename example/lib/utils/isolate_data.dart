import 'dart:isolate';
import 'package:example/data/models/comment_model.dart';
import 'package:example/objectbox.g.dart';

Future<void> insertLargeDataInIsolateSpawn(
    String dbDir, List<Map<String, dynamic>> commentsData) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_backgroundInsert, [dbDir, commentsData, receivePort.sendPort]);

  await receivePort.first; // wait until isolate signals done
}

void _backgroundInsert(List args) {
  final String dbDir = args[0];
  final List<Map<String, dynamic>> commentsData = args[1];
  final SendPort sendPort = args[2];

  final store = Store(getObjectBoxModel(), directory: dbDir);
  final box = store.box<CommentModel>();

  final comments = commentsData.map((m) => CommentModel.fromJson(m)).toList();

  // store.runInTransaction(TxMode.write, () => box.putMany(comments));

  box.putMany(comments);

  store.close();

  sendPort.send(true); // signal completion
}
