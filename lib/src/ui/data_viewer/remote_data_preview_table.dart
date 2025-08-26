import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class RemoteDataPreviewTable extends StatelessWidget {
  const RemoteDataPreviewTable({super.key, required this.dataUpdates});
  final List<SyncDataEntity> dataUpdates;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Device')),
            DataColumn(label: Text('User ID')),
            DataColumn(label: Text('Total Updates')),
          ],
          rows:
              dataUpdates
                  .map(
                    (data) => DataRow(
                      cells: [
                        DataCell(Text(formatDate(data.createdAt))),
                        DataCell(Text(data.deviceId)),
                        DataCell(Text(data.userId)),
                        DataCell(Text(data.data.length.toString())),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
