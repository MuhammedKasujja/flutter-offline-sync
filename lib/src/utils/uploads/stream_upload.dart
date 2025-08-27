import 'dart:convert';
import 'package:dio/dio.dart';

/// Returns a Stream of JSON bytes in chunks
Stream<List<int>> jsonByteStream(dynamic jsonData, {int chunkSize = 1024 * 1024}) async* {
  final jsonString = jsonData is String ? jsonData : jsonEncode(jsonData);
  final bytes = utf8.encode(jsonString);

  int offset = 0;
  while (offset < bytes.length) {
    final end = (offset + chunkSize > bytes.length) ? bytes.length : offset + chunkSize;
    yield bytes.sublist(offset, end);
    offset = end;
  }
}

/// Upload JSON from memory as a stream
Future<void> uploadJsonStream(dynamic jsonData) async {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(minutes: 15),
  ));

  final bytes = utf8.encode(jsonData is String ? jsonData : jsonEncode(jsonData));
  final stream = jsonByteStream(jsonData);

  final response = await dio.post(
    "https://your-api.com/upload",
    data: stream,
    options: Options(
      headers: {
        "Content-Type": "application/json",
        "Content-Length": bytes.length, // optional but recommended
      },
    ),
    onSendProgress: (sent, total) {
      print("📤 Uploading: ${(sent / total * 100).toStringAsFixed(2)}%");
    },
  );

  print("✅ Upload complete: ${response.statusCode}");
}
