import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/sync_update/sync_update_bloc.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class SyncRemoteChangesWidget extends StatelessWidget {
  const SyncRemoteChangesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SyncUpdateBloc, SyncUpdateState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message, remoteUpdates) {
            context.toast.success('Remote updates saved');
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Remote Changes'),
            actions: [
              if (state.remoteUpdates.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.remoteUpdates.length.toString()),
                ),
            ],
            backgroundColor: Colors.transparent,
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
                if (state.remoteUpdates.isNotEmpty)
                  FilledButton(
                    onPressed: () {
                      context.read<SyncUpdateBloc>().add(
                        PersistRemoteChangesManually(),
                      );
                    },
                    child: Text('Save Changes'),
                  ),
              ],
            ),
          ],
          body: SingleChildScrollView(
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
                    state.remoteUpdates
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
          ),
        );
      },
    );
  }
}
