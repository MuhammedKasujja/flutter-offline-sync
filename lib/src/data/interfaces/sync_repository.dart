import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

abstract class ISyncRepository {
  Future<List<Map<String, dynamic>>> getPendingLocalUpdates();
  Future<void> clearUpdatesTable();
  Future<void> saveRemoteChanges(List<DataEntity> remoteDatachanges);
}
