import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

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
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final update = DataEntity.fromJson(data[index]);
        return ListTile(
          title: Text(update.entity),
          subtitle: Text(
            update.updatedAt != null
                ? formatDate(update.updatedAt!)
                : 'Not applicable',
          ),
          trailing: Chip(label: Text(update.operation), padding: EdgeInsets.all(4),),
        );
      },
    );
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     spacing: 20,
    //     children: [
    //       Text('Pending Local updates'),
    //       Text(
    //         '${data.length}',
    //         style: Theme.of(context).textTheme.headlineMedium,
    //       ),
    //       OutlinedButton.icon(
    //         onPressed: onSyncUpdates,
    //         label: Text('Sync updates'),
    //         icon: Icon(Icons.sync),
    //       ),
    //     ],
    //   ),
    // );
  }
}
