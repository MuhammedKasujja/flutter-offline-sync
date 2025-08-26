import 'package:flutter/material.dart';

class LargerDataPreviewWidget extends StatelessWidget {
  const LargerDataPreviewWidget({
    super.key,
    required this.data,
    required this.onSyncUpdates,
  });
  final List<Map<String, dynamic>> data;
  final void Function() onSyncUpdates;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Text('Pending Local updates'),
          Text('${data.length}', style: Theme.of(context).textTheme.titleLarge),
          OutlinedButton.icon(
            onPressed: onSyncUpdates,
            label: Text('Sync updates'),
            icon: Icon(Icons.sync),
          ),
        ],
      ),
    );
  }
}
