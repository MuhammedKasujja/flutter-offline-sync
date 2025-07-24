import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser_interface.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/flutter_sync.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

import 'configuration_service.dart';

// This class is responsible for synchronizing data between local storage and remote servers.
class SyncroniserService {
  final IDataSyncroniser _repo;
  SyncroniserService(this._repo);

  Future startSync(String syncId) async {
    startLocalSync(syncId);
    startSyncRemoteChanges();
  }

  void startLocalSync(String syncId) {
    _repo
        .syncLocalUpdates(
          updateId: syncId,
          extras: FlutterSync.instance.requestExtras,
        )
        .then((response) {
          logger.info({'Sync Ended Local Updates': response.toJson()});
          if (response.success) {
            ConfigService.updateLastSyncDate(response.data!.lastSyncDate);
            _repo.clearUpdatesTable();
          }
        });
  }

  void startSyncRemoteChanges() {
    _repo
        .fetchRemoteUpdates()
        .then((response) {
          if (response.isSuccess) {
            final List<DataEntity> dataUpdates =
                response.data!.expand((item) => item.data).toList();

            _repo.syncRemoteUpdates(dataUpdates);
            logger.info({
              'Sync Remote updates': '${response.data?.length} total updates',
            });
          }
        })
        .catchError((error) {
          logger.error('Error starting sync remote changes', error);
        });
  }

  void syncLocalData() async {
    final response = await _repo.syncLocalUpdates(
      updateId: '340',
      extras: FlutterSync.instance.requestExtras,
    );
    logger.info({'Sync Ended Local Updates': response.toJson()});

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

  void fetchRemoteData() async {
    try {
      final response = await _repo.fetchRemoteUpdates();
      if (response.isSuccess) {
        /// TODO: schedule/ run on a background thread
        /// to avoid blocking the main thread
        /// This can be done using Isolates
        /// or using a background service
        /// This is a simple example of how to use Isolates

        final List<DataEntity> dataUpdates =
            response.data!.expand((item) => item.data).toList();

        await _repo.syncRemoteUpdates(dataUpdates);
        logger.info({
          'Sync Remote updates': '${response.data?.length} total updates',
        });
      }
    } catch (error) {
      logger.error('Error starting sync remote changes', error);
      return;
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
}
