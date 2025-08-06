import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class SyncDataViewer extends StatefulWidget {
  const SyncDataViewer({super.key});

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
        context.read<SyncUpdateBloc>().add(
          SaveRemoteUpdates(remoteUpdates: remoteUpdates),
        );
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
      body: SingleChildScrollView(
        child: BlocConsumer<LocalUpdatesBloc, LocalUpdatesState>(
          listener: (context, state) {
            state.whenOrNull(
              uploaded: (message) {
                context.toast.success(message);
                context.read<LocalUpdatesBloc>().add(FetchLocalChanges());
              },
            );
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: state.maybeWhen(
                success:
                    (data) =>
                        data.isEmpty
                            ? Center(child: Text('No local updates available'))
                            : _jsonViewer(data),
                failure: (error) => Center(child: Text('$error')),
                orElse: () => Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
      floatingActionButton: BlocListener<RemoteUpdatesBloc, RemoteUpdatesState>(
        listener: onRemoteChangesFetched,
        child: FloatingActionButton(
          onPressed: syncUpdates,
          child: Icon(Icons.sync),
        ),
      ),
    );
  }
}

Widget _jsonViewer(dynamic json) {
  if (json is Map<String, dynamic>) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          json.entries.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${e.key}: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: _jsonViewer(e.value)),
              ],
            );
          }).toList(),
    );
  } else if (json is List) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          json.asMap().entries.map((entry) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('[${entry.key}]: '),
                Expanded(child: _jsonViewer(entry.value)),
              ],
            );
          }).toList(),
    );
  } else {
    return Text(json.toString());
  }
}
