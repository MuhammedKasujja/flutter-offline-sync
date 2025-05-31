import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';

// TODO: Using Isolates to handle data syncronization to remove work on the main thread
class DataSyncroniser extends IDataSyncroniser {
  final SyncRequest _request;

  late final ApiClient _apiClient;

  DataSyncroniser({required SyncRequest request}) : _request = request {
    _apiClient = ApiClient(
      dio: Dio(
        BaseOptions(
          baseUrl: request.baseUrl,
          contentType: 'application/json',
          headers: {
            request.authToken != null
                    ? 'Authorization'
                    : 'Bearer ${request.authToken}':
                '',
          },
        ),
      ),
    );
  }

  @override
  Future<ApiResponse> syncLocalUpdates() async {
    final box = getBox<DataEntity>();

    final updates = await box.getAllAsync();
    final List<Map<String, dynamic>> map =
        updates.map((data) => data.toJson()).toList();

    return _apiClient.post(_request.syncLocalEndpoint, data: map);
  }

  @override
  Future<ApiResponse<DataEntity>> syncRemoteUpdates() {
    return _apiClient.get(_request.syncRemoteEndpoint);
  }
}
