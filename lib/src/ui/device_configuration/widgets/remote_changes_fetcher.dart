import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class RemoteChangesFetcherWidget extends StatelessWidget {
  const RemoteChangesFetcherWidget({super.key});

  void handleAfterRemoteChanges(
    BuildContext context,
    RemoteUpdatesState state,
  ) {
    state.whenOrNull(
      success: (remoteUpdates) {
        Future.delayed(Duration(seconds: 1), () {
          if (context.mounted) {
            context.read<DeviceConfigurationBloc>().add(
              DeviceConfigurationEvent.showSyncRemoteUpdates(),
            );
            context.read<SyncUpdateBloc>().add(
              StageRemoteChanges(changes: remoteUpdates),
            );
          }
        });
      },
      failure: (error) => context.toast.error(error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetching Remote updates')),
      body: BlocConsumer<RemoteUpdatesBloc, RemoteUpdatesState>(
        listener: handleAfterRemoteChanges,
        builder: (context, state) {
          return state.maybeWhen(
            success:
                // this only shows when no updates are found otherwise [SyncRemoteChangesWidget] is visible
                (updates) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        updates.isEmpty
                            ? 'No updates found'
                            : '${updates.length} Remote updates found',
                      ),
                      if (updates.isEmpty)
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                    ],
                  ),
                ),
            loading:
                () => Center(
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
            failure:
                (error) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [Text('$error')],
                  ),
                ),
            orElse: () => Text('Nothing to show'),
          );
        },
      ),
    );
  }
}
