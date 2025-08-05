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
        context.read<DeviceConfigurationBloc>().add(
          DeviceConfigurationEvent.showSyncRemoteUpdates(),
        );
        // Future.delayed(Duration(seconds: 2), (){

        // });
        context.read<SyncUpdateBloc>().add(
          SaveRemoteUpdates(remoteUpdates: remoteUpdates),
        );
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
                (_) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text('No updates found'),
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
