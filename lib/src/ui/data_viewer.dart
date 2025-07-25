import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_offline_sync/src/providers/local_data_updates.dart';
import 'package:flutter_offline_sync/src/providers/manual_sync_manager.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class SyncDataViewer extends ConsumerStatefulWidget {
  const SyncDataViewer({super.key});

  @override
  ConsumerState<SyncDataViewer> createState() => _SyncDataViewerState();
}

class _SyncDataViewerState extends ConsumerState<SyncDataViewer> {
  @override
  void initState() {
    Future.microtask(
      () => ref.read(localDataUpdatesProvider.notifier).fetchLocalUpdates(),
    );
    super.initState();
  }

  Future fetchLocalUpdates() async {
    ref.read(localDataUpdatesProvider.notifier).fetchLocalUpdates();
  }

  @override
  Widget build(BuildContext context) {
    final syncManager = ref.watch(manualSyncManagerProvider);
    ref.listen<AsyncValue<void>>(manualSyncManagerProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          context.toast.success('Syncronizations Completed Successfully!');
          fetchLocalUpdates();
        },
        error: (e, _) => context.toast.error('Failed: $e'),
      );
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Consumer(
            builder: (context, ref, _) {
              final provider = ref.watch(localDataUpdatesProvider);
              switch (provider) {
                case AsyncData(:final value):
                  return RefreshIndicator(
                    onRefresh: fetchLocalUpdates,
                    child:
                        value.isEmpty
                            ? Center(child: Text('No local updates available'))
                            : _jsonViewer(value),
                  );
                case AsyncError(:final error):
                  return Center(child: Text('$error'));
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            syncManager.isLoading
                ? null
                : () => ref.read(manualSyncManagerProvider.notifier).syncData(),
        child: Icon(Icons.sync),
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
