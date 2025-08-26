import 'package:flutter/material.dart';

class JsonViewerWidget extends StatelessWidget {
  const JsonViewerWidget({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    if (data is Map<String, dynamic>) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            (data as Map<String, dynamic>).entries.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${e.key}: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: JsonViewerWidget(data: e.value)),
                ],
              );
            }).toList(),
      );
    } else if (data is List) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            (data as List).asMap().entries.map((entry) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('[${entry.key}]: '),
                  Expanded(child: JsonViewerWidget(data: entry.value)),
                ],
              );
            }).toList(),
      );
    } else {
      return Text(data.toString());
    }
  }
}
