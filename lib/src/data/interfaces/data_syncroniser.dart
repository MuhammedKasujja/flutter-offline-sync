import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';

abstract class IDataSyncroniser {
  Future<ApiResponse> syncLocalUpdates();
  Future<ApiResponse<DataEntity>> syncRemoteUpdates();
}
