import 'package:example/data/models/comment_model.dart';
import 'package:example/objectbox.g.dart';
import 'package:flutter/foundation.dart';

/// This function runs in the isolate
Future<void> _insertLargeDataIsolate(Map<String, dynamic> args) async {
  final String dbDir = args['dbDir'];
  final List<Map<String, dynamic>> commentsData = args['comments'];
  final comments = commentsData.map((m) => CommentModel.fromJson(m)).toList();

  // Each isolate needs its own Store
  final store = Store(getObjectBoxModel(), directory: dbDir);

  final box = store.box<CommentModel>();

  // Use a write transaction for performance
  box.putMany(comments);

  store.close();
}

/// Public API you call from UI isolate
Future<void> insertLargeDataInIsolate(
  String dbDir,
  List<Map<String, dynamic>> comments,
) async {
  await compute(_insertLargeDataIsolate, {
    'dbDir': dbDir,
    'comments': comments,
  });
}
