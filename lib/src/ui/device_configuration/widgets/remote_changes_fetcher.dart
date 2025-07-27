import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/providers/remote_data_updates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteChangesFetcherWidget extends ConsumerWidget {
  const RemoteChangesFetcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(remoteDataUpdatesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Fetching Remote updates')),
      body: provider.when(
        data:
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
                children: [CircularProgressIndicator(), Text('Please wait...')],
              ),
            ),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [Text('$error')],
              ),
            ),
      ),
    );
  }
}
