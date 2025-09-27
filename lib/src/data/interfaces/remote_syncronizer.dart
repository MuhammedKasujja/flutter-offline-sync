import 'package:flutter_offline_sync/src/data/models/remote_update_entity.dart'
    show RemoteUpdateEntity;
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';

abstract class RemoteSyncronizer {
  Future<List<RemoteUpdateEntity>> getSavedRemoteChanges();
  Future<List<SyncDataEntity>> getRemoteLocalUnSavedData();
  Future<DataUploadMap> fetchRemoteNonSyncedData();
  Future<void> syncRemoteUpdates();
  Future<int> clearUpdatesTable();
}
