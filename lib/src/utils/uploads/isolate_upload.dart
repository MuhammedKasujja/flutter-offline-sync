import 'dart:async';
import 'dart:isolate';

import 'compress.dart';

Future<void> startUploadWithProgress(
  Map<String, dynamic> jsonData,
  void Function(double progress) onProgress,
) async {
  final port = ReceivePort();
  await Isolate.spawn(_uploadIsolateEntry, (
    sendPort: port.sendPort,
    jsonData: jsonData,
  ));

  await for (var message in port) {
    if (message is double) {
      onProgress(message);
    } else if (message == 'done') {
      port.close();
      break;
    }
  }
}

void _uploadIsolateEntry(
  ({SendPort sendPort, Map<String, dynamic> jsonData}) data,
) async {
  await uploadJsonFromMemory(
    data.jsonData,
    onProgress: (progress) {
      data.sendPort.send(progress);
    },
  );

  data.sendPort.send('done');
}

// Future<void> startUpload() async {
//   setState(() {
//     isUploading = true;
//     progress = 0.0;
//   });

//   final jsonData = {
//     "items": List.generate(500000, (i) => {"id": i, "name": "Item $i"})
//   };

//   await startUploadWithProgress(jsonData, (p) {
//     setState(() {
//       progress = p;
//     });
//   });

//   setState(() {
//     isUploading = false;
//   });

//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(content: Text("Upload Complete")),
//   );
// }
