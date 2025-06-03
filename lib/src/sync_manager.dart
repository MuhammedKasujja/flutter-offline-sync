import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'network_status.dart';

part 'sync_manager.g.dart';

@Riverpod(keepAlive: true)
class SyncManager extends _$SyncManager {
  late final DataSyncroniser _repo;

  @override
  FutureOr<void> build() async {
    _repo = FlutterSync.I.syncroniser;

    ref.listen<AsyncValue<bool>>(networkStatusProvider, (previous, next) {
      next.whenData((isConnected) {
        if (isConnected) {
          _startSync();
        }
      });
    });
  }

  Future<void> _startSync() async {
    logger.info('Sync started');
    final response = await _repo.syncLocalUpdates();
    logger.info({'Sync Ended': response.toJson()});
    // final pendingTasks = await _repo.getPendingUpdates();

    // for (final task in pendingTasks) {
    //   try {
    //     await _repo.processTask(task);
    //     await _repo.markTaskAsSynced(task);
    //   } catch (e) {
    //     // log and retry later
    //   }
    // }
  }
}

Future<void> retryWithBackoff(
  Future<void> Function() action, {
  int maxRetries = 5,
  Duration initialDelay = const Duration(seconds: 2),
}) async {
  int retryCount = 0;

  while (retryCount < maxRetries) {
    try {
      await action();
      return;
    } catch (e) {
      retryCount++;
      if (retryCount >= maxRetries) rethrow;

      final delay = Duration(seconds: initialDelay.inSeconds * (1 << (retryCount - 1)));
      await Future.delayed(delay);
    }
  }
}
