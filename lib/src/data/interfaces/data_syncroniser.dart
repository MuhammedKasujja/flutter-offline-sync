import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

abstract class IDataSyncroniser {
  /// Upload current local updates
  Future<ApiResponse> syncLocalUpdates({Map<String, dynamic>? extras});

  /// Get updates from the remote central server
  Future<ApiResponse<DataEntity>> syncRemoteUpdates();

  Future addRequestExtras(Map<String, dynamic> extras);
}
