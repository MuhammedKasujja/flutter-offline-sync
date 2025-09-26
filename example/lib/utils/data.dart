// Message class for isolate communication
import 'dart:isolate';

import 'package:example/data/models/comment_model.dart';
import 'package:example/data/objectbox.dart';

class DatabaseRequest {
  final SendPort replyPort;
  final List<CommentModel> comments;

  DatabaseRequest(this.replyPort, this.comments);
}

// Function to insert large JSON data without blocking the UI
Future<void> insertLargeDataInIsolateSpawnRefactor(
  List<Map<String, dynamic>> commentsData,
) async {
  final receivePort = ReceivePort();

  // Spawn an isolate to parse JSON data (CPU-intensive task)
  await Isolate.spawn(_backgroundParse, [commentsData, receivePort.sendPort]);

  // Wait for parsed CommentModel objects from the isolate
  final result = await receivePort.first as DatabaseRequest;
  receivePort.close();

  // Insert the parsed data into the store in the main isolate
  final box = ObjectBox.instance.store.box<CommentModel>();
  box.putMany(result.comments);

  // Handle the response from the isolate
  result.replyPort.send(true); // Signal completion
}

// Isolate function to parse JSON data into CommentModel objects
void _backgroundParse(List args) {
  final List<Map<String, dynamic>> commentsData = args[0];
  final SendPort sendPort = args[1];

  // Parse JSON data into CommentModel objects (CPU-intensive)
  final comments = commentsData.map((m) => CommentModel.fromJson(m)).toList();

  // Send the parsed objects back to the main isolate
  sendPort.send(DatabaseRequest(ReceivePort().sendPort, comments));
}
