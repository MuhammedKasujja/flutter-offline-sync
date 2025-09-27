import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_data_entity.dart';

abstract class IDataSyncroniser {
  /// Upload current local updates
  Future<ApiResponse<LocalSyncDataResponse>> syncLocalUpdates({
    required String updateId,
    Map<String, dynamic>? extras,
  });

  /// Get updates from the remote central server
  // Future<void> syncRemoteUpdates(DataUploadMap remoteUpdates);

  Future<ApiResponse<List<SyncDataEntity>>> fetchRemoteUpdates();

  Future addRequestExtras(Map<String, dynamic> extras);

  Future<void> clearUpdatesTable();
}
