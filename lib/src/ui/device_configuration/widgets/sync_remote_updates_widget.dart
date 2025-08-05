import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/sync_update/sync_update_bloc.dart';

class SyncRemoteChangesWidget extends StatelessWidget {
  const SyncRemoteChangesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saving Remote Changes')),
      body: BlocBuilder<SyncUpdateBloc, SyncUpdateState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: state.mapOrNull(
              loading:
                  (data) => Container(
                    color: Theme.of(context).cardColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          CircularProgressIndicator(),
                          Text('Please wait...'),
                        ],
                      ),
                    ),
                  ),
              success:
                  (data) => Container(
                    color: Theme.of(context).cardColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text('Data Saved'),
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    ),
                  ),
              error: (error) => Text(error.toString()),
            ),
          );
        },
      ),
    );
  }
}
