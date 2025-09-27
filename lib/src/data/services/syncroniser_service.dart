import 'dart:convert';

import 'package:flutter_offline_sync/src/data/models/remote_update_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser/data_syncroniser_interface.dart';
import 'package:flutter_offline_sync/src/flutter_sync.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

import 'configuration_service.dart';
import 'data/local_data_updates.dart';

// This class is responsible for synchronizing data between local storage and remote servers.
class SyncroniserService {
  final IDataSyncroniser _repo;
  SyncroniserService(this._repo);

  Future startSync(String syncId) async {
    // startLocalSync(syncId);
    syncLocalChanges(syncId);
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
          } else {
            throw response.error ?? 'Error syncing data';
          }
        });
  }

  Future syncLocalChanges(String updateId) async {
    final response = await _repo.syncLocalUpdates(
      updateId: updateId,
      extras: FlutterSync.instance.requestExtras,
    );
    logger.info({'Sync Ended Local Updates': response.toJson()});

    if (response.success) {
      final lastSyncDate = getConfig()!.getLastSyncDate();
      await LocalDataUpdates(
        FlutterSync.instance.entityRegistry,
      ).markEntitiesAsSynced(lastSyncDate);

      ConfigService.updateLastSyncDate(response.data!.lastSyncDate);
      _repo.clearUpdatesTable();
    } else {
      throw Exception(response.error ?? 'Error syncing local data');
    }
    //TODO: sync data using sequencially for each entity

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

  Future<List<SyncDataEntity>> fetchRemotePendingData() async {
    final response = await _repo.fetchRemoteUpdates();
    if (response.isError) {
      throw Exception(response.error ?? 'Unknown error occured');
    }

    for (var remoteUpdate in response.data ?? []) {
      final remoteUpload = RemoteUpdateEntity(data: jsonEncode(remoteUpdate));
      remoteUpload.save();
    }

    return response.data ?? [];
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
