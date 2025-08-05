import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/local_updates/local_updates_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    // ref.listen<AsyncValue<void>>(manualSyncManagerProvider, (prev, next) {
    //   next.whenOrNull(
    //     data: (_) {
    //       context.toast.success('Syncronizations Completed Successfully!');
    //       fetchLocalUpdates();
    //     },
    //     error: (e, _) => context.toast.error('Failed: $e'),
    //   );
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<LocalUpdatesBloc, LocalUpdatesState>(
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //       syncManager.isLoading
      //           ? null
      //           : () => ref.read(manualSyncManagerProvider.notifier).syncData(),
      //   child: Icon(Icons.sync),
      // ),
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
