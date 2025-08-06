import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/sync_update/sync_update_bloc.dart';
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
          appBar: AppBar(
            title: Text('Remote Changes'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state.remoteUpdates.length.toString()),
              ),
            ],
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
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Entity')),
                DataColumn(label: Text('Operation')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Action')),
              ],
              rows:
                  state.remoteUpdates
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(Text(data.entity.toString())),
                            DataCell(Text(data.operation)),
                            DataCell(
                              Text(data.updatedAt?.toIso8601String() ?? ''),
                            ),
                            DataCell(
                              TextButton(
                                onPressed: () {},
                                child: Icon(Icons.save),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
    );
  }
}
