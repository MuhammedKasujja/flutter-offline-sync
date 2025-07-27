import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/providers/remote_data_updates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SyncRemoteChangesWidget extends ConsumerWidget {
  const SyncRemoteChangesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(syncRemoteUpdatesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Saving Remote Changes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: provider.mapOrNull(
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
          data:
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
        ),
      ),
    );
  }
}
