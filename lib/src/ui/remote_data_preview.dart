import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/remote_updates/remote_updates_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/sync_update/sync_update_bloc.dart';
import 'package:flutter_offline_sync/src/ui/data_viewer/remote_data_preview_table.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class RemoteDataPreviewWidget extends StatelessWidget {
  const RemoteDataPreviewWidget({super.key});

  void onRemoteChangesFetched(BuildContext context, RemoteUpdatesState state) {
    state.whenOrNull(
      success: (remoteUpdates) {
        context.read<SyncUpdateBloc>().add(StageRemoteChanges());
        logger.info(remoteUpdates.length);
      },
      failure: (error) => context.toast.error(error),
    );
  }

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
          body:
              state.remoteUpdates.isNotEmpty
                  ? RemoteDataPreviewTable(dataUpdates: state.remoteUpdates)
                  : RemoteUpdatesSkelton(),
          persistentFooterButtons:
              state.remoteUpdates.isNotEmpty
                  ? [
                    FilledButton.icon(
                      onPressed: () {
                        context.read<SyncUpdateBloc>().add(
                          PersistRemoteChangesManually(),
                        );
                      },
                      label: Text('Save Changes'),
                      icon: state.whenOrNull(
                        loading:
                            (_) => SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                      ),
                    ),
                  ]
                  : null,
          floatingActionButton:
              BlocListener<RemoteUpdatesBloc, RemoteUpdatesState>(
                listener: onRemoteChangesFetched,
                child:
                    state.remoteUpdates.isEmpty
                        ? FloatingActionButton(
                          onPressed: () {
                            context.read<RemoteUpdatesBloc>().add(
                              FetchRemotePendingUpdates(),
                            );
                          },
                          tooltip: 'Download changes',
                          child: Icon(Icons.sync),
                        )
                        : null,
              ),
        );
      },
    );
  }
}

class RemoteUpdatesSkelton extends StatelessWidget {
  const RemoteUpdatesSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteUpdatesBloc, RemoteUpdatesState>(
      builder: (context, state) {
        return state.maybeMap(
          loading:
              (value) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading remote changes ....'),
                  ],
                ),
              ),
          orElse: () => Center(child: Text('No Remote Updates')),
        );
      },
    );
  }
}
