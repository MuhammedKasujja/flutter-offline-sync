import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';

Uint8List compressJsonToGzip(Map<String, dynamic> jsonData) {
  final jsonString = jsonEncode(jsonData);
  final jsonBytes = utf8.encode(jsonString);

  return GZipEncoder().encodeBytes(jsonBytes);
  // final compressed = GZipEncoder().encode(jsonBytes);
  // return Uint8List.fromList(compressed);
}

Future<void> uploadGzipChunks(
  Uint8List compressedData, {
  int chunkSize = 5 * 1024 * 1024, // 5MB
  void Function(double progress)? onProgress, // progress callback
}) async {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(minutes: 15),
    ),
  );

  final totalLength = compressedData.length;
  int offset = 0;
  int chunkIndex = 0;

  while (offset < totalLength) {
    final remaining = totalLength - offset;
    final size = remaining > chunkSize ? chunkSize : remaining;
    final chunk = compressedData.sublist(offset, offset + size);

    chunkIndex++;

    await dio.post(
      "https://your-api.com/upload-chunk",
      data: Stream.fromIterable([chunk]),
      options: Options(
        headers: {
          "Content-Type": "application/octet-stream",
          "Content-Encoding": "gzip",
          "Content-Range": "bytes $offset-${offset + size - 1}/$totalLength",
          "Chunk-Index": chunkIndex.toString(),
        },
      ),
    );

    offset += size;

    final progress = offset / totalLength * 100;
    if (onProgress != null) onProgress(progress);
  }

  await dio.post("https://your-api.com/upload-complete");
}

Future<void> uploadJsonFromMemory(
  dynamic jsonData, {
  void Function(double progress)? onProgress,
}) async {
  final compressedData = compressJsonToGzip(jsonData);
  print("✅ Compressed size: ${compressedData.length} bytes");
  await uploadGzipChunks(compressedData, onProgress: onProgress);
}

/// this uploads on the main thread / isolate
void startUpload() async {
  final jsonData = {
    "items": List.generate(500000, (i) => {"id": i, "name": "Item $i"}),
  };

  await uploadJsonFromMemory(
    jsonData,
    onProgress: (progress) {
      print("📤 Upload progress: ${progress.toStringAsFixed(2)}%");
    },
  );
}
