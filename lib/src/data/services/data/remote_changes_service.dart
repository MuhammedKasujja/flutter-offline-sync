import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_offline_sync/src/data/interfaces/remote_syncronizer.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/remote_update_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';
import 'package:flutter_offline_sync/src/flutter_sync.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class RemoteChangesService extends RemoteSyncronizer {
  @override
  Future<List<RemoteUpdateEntity>> getSavedRemoteChanges() {
    return getBox<RemoteUpdateEntity>().getAllAsync();
  }

  @override
  Future<List<SyncDataEntity>> getRemoteLocalUnSavedData() async {
    final changes = await getSavedRemoteChanges();
    List<SyncDataEntity> remote = [];

    for (var update in changes) {
      final data = SyncDataEntity.fromJson(jsonDecode(update.data));
      remote.add(data);
    }
    return remote;
  }

  @override
  Future<List<DataEntity>> fetchRemoteNonSyncedData() async {
    final remotes = await getRemoteLocalUnSavedData();

    final List<DataEntity> dataUpdates =
        remotes.expand((item) => item.data).toList();

    return sortInBackground(dataUpdates);
  }

  @override
  Future<void> syncRemoteUpdates() async {
    final remoteUpdates = await fetchRemoteNonSyncedData();

    if (remoteUpdates.isEmpty) {
      logger.info('No Remote updates found');
      return;
    }
    try {
      // lift json decode to a separate Isolate to avoid blocking the UI
      final decodedList = await compute(
        Parser.decodeRemoteEntitiesInIsolate,
        remoteUpdates,
      );

      for (var entry in decodedList) {
        FlutterSync.instance.entityRegistry.save(
          entry.key, // EntityName
          entry.value, // Entity JSON
        );
      }
      clearUpdatesTable();
    } catch (error, stackTrace) {
      logger.error(error);
      logger.debug(stackTrace);
      rethrow;
    }
  }

  @override
  Future<int> clearUpdatesTable() async {
    return getBox<RemoteUpdateEntity>().removeAllAsync();
  }
}

Future<List<DataEntity>> sortInBackground(List<DataEntity> updates) async {
  final sorted = await compute(
    sortRemoteUpdatesByDate,
    updates.map((u) => u.toJson()).toList(),
  );

  return sorted.map(DataEntity.fromJson).toList();
}

List<Map<String, dynamic>> sortRemoteUpdatesByDate(
  List<Map<String, dynamic>> updatesJson,
) {
  final updates = updatesJson.map(DataEntity.fromJson).toList();

  updates.sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));

  return updates.map((u) => u.toJson()).toList();
}
