import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/ui/data_viewer/json_viewer_widget.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

import 'data_viewer/larger_data_preview.dart';

class SyncDataViewer extends StatefulWidget {
  const SyncDataViewer({super.key, required this.viewJson});
  final bool viewJson;

  @override
  State<SyncDataViewer> createState() => _SyncDataViewerState();
}

class _SyncDataViewerState extends State<SyncDataViewer> {
  @override
  void initState() {
    Future.microtask(fetchLocalUpdates);
    super.initState();
  }

  Future fetchLocalUpdates() async {
    context.read<LocalUpdatesBloc>().add(FetchLocalChanges());
  }

  void onRemoteChangesFetched(BuildContext context, RemoteUpdatesState state) {
    state.whenOrNull(
      success: (remoteUpdates) {
        // context.read<SyncUpdateBloc>().add(
        //   SaveRemoteUpdates(remoteUpdates: remoteUpdates),
        // );
        context.read<SyncUpdateBloc>().add(StageRemoteChanges());
      },
      failure: (error) => context.toast.error(error.toString()),
    );
  }

  void syncUpdates() {
    final locallBloc = context.read<LocalUpdatesBloc>();
    locallBloc.state.whenOrNull(
      success: (pendingChanges) {
        // Only trigger upload local changes if there are some local changes
        if (pendingChanges.isNotEmpty) {
          locallBloc.add(UploadLocalChanges());
        }
      },
    );
    context.read<RemoteUpdatesBloc>().add(FetchRemotePendingUpdates());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocalUpdatesBloc, LocalUpdatesState>(
        listener: (context, state) {
          state.whenOrNull(
            uploaded: (message) {
              context.toast.success(message);
              context.read<LocalUpdatesBloc>().add(FetchLocalChanges());
            },
            failure: (error) => context.toast.error(error),
          );
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: state.maybeWhen(
              success:
                  (data) =>
                      data.isEmpty
                          ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 12,
                              children: [
                                Icon(Icons.info_outline),
                                Text('No Local changes available!'),
                              ],
                            ),
                          )
                          : widget.viewJson &&
                              data.length < kDataPreviewThreshold
                          ? SingleChildScrollView(
                            child: JsonViewerWidget(data: data),
                          )
                          : LargerDataPreviewWidget(
                            data: data,
                            onSyncUpdates: syncUpdates,
                          ),
              failure: (error) => Center(child: Text('$error')),
              orElse: () => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
      floatingActionButton: BlocListener<RemoteUpdatesBloc, RemoteUpdatesState>(
        listener: onRemoteChangesFetched,
        child: FloatingActionButton(
          onPressed: syncUpdates,
          tooltip: 'Upload changes',
          child: Icon(Icons.sync),
        ),
      ),
    );
  }
}
