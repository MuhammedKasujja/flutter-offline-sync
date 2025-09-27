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
  Future<DataUploadMap> fetchRemoteNonSyncedData() async {
    final remotes = await getRemoteLocalUnSavedData();

    final List<DataEntity> modelUpdates =
        remotes.expand((item) => item.data.models).toList();

    final sortByCreatedAt = await FlutterSync.canSyncUsingCreatedAt();

    final sortedRelations = await sortInBackground(
      updates: remotes.expand((item) => item.data.relations).toList(),
      sortByCreatedAt: sortByCreatedAt,
    );

    final sortedModels = await sortInBackground(
      updates: modelUpdates,
      sortByCreatedAt: sortByCreatedAt,
    );

    return DataUploadMap(models: sortedModels, relations: sortedRelations);
  }

  @override
  Future<void> syncRemoteUpdates() async {
    final remoteUpdates = await fetchRemoteNonSyncedData();

    if (remoteUpdates.models.isEmpty) {
      logger.info('No Remote updates found');
      return;
    }
    try {
      /// Save relations first to avoid double saving the same entity
      /// lift json decode to a separate Isolate to avoid blocking the UI
      final decodedRelationsList = await compute(
        Parser.decodeRemoteEntitiesInIsolate,
        remoteUpdates.relations,
      );

      for (var entry in decodedRelationsList) {
        FlutterSync.instance.entityRegistry.save(
          entry.key, // EntityName
          entry.value, // Entity JSON
        );
      }

      /// Save Entities/ Models last
      /// lift json decode to a separate Isolate to avoid blocking the UI
      ///
      final decodedModelList = await compute(
        Parser.decodeRemoteEntitiesInIsolate,
        remoteUpdates.models,
      );

      for (var entry in decodedModelList) {
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

Future<List<DataEntity>> sortInBackground({
  required List<DataEntity> updates,
  bool sortByCreatedAt = false,
}) async {
  final sorted = await compute(sortRemoteUpdatesByDate, {
    'updates': updates.map((u) => u.toJson()).toList(),
    'sortByCreatedAt': sortByCreatedAt,
  });

  return sorted.map(DataEntity.fromJson).toList();
}

List<Map<String, dynamic>> sortRemoteUpdatesByDate(Map<String, dynamic> map) {
  final sortByCreatedAt = map['sortByCreatedAt'] as bool;

  final updates =
      (map['updates'] as List<Map<String, dynamic>>)
          .map(DataEntity.fromJson)
          .toList();

  if (sortByCreatedAt) {
    updates.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
  } else {
    updates.sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
  }

  return updates.map((u) => u.toJson()).toList();
}
