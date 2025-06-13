import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

import 'network_status.dart';

part 'sync_manager.g.dart';

@Riverpod(keepAlive: true)
class SyncManager extends _$SyncManager {
  late IDataSyncroniser _repo;

  @override
  FutureOr<void> build() async {
    ref.listen<AsyncValue<bool>>(networkStatusProvider, (previous, next) {
      next.whenData((isConnected) async {
        if (isConnected) {
          final config = await ConfigService.getSettings();
          if (config != null && config.hasRemoteCredentials) {
            _startSync();
            _startSyncRemoteChanges();
          }
        }
      });
    });
  }

  Future<void> _startSync() async {
    logger.info('Sync started');
    _repo = AppConfig.instance.syncronizer;
    final response = await _repo.syncLocalUpdates(
      extras: FlutterSync.instance.requestExtras,
    );
    logger.info({'Sync Ended': response.toJson()});

    if (response.success) {
      await _repo.clearUpdatesTable();
    }
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

  Future<void> _startSyncRemoteChanges() async {
    _repo = AppConfig.instance.syncronizer;
    final response = await _repo.fetchRemoteUpdates();
    if (response.isSuccess) {
      /// TODO: schedule/ run on a background thread
      await _repo.syncRemoteUpdates(response.data!);
      logger.info({
        'Sync Remote updates': '${response.data?.length} total updates',
      });
    }
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

      final delay = Duration(
        seconds: initialDelay.inSeconds * (1 << (retryCount - 1)),
      );
      await Future.delayed(delay);
    }
  }
}
