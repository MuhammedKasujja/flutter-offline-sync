import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

// TODO: Using Isolates to handle data syncronization to remove work on the main thread
class DataSyncroniser extends IDataSyncroniser {
  final SyncRequest _request;

  late final ApiClient _apiClient;

  Map<String, dynamic>? extras;

  DataSyncroniser({required SyncRequest request}) : _request = request {
    _apiClient = ApiClient(
      dio: Dio(
        BaseOptions(
          baseUrl: _request.baseUrl,
          contentType: 'application/json',
          headers: _headers,
        ),
      ),
    );
  }
  Map<String, dynamic>? get _headers {
    logger.debug({'AuthToken': _request.authToken});
    if (_request.authToken != null && _request.authToken!.isNotEmpty) {
      return {'Authorization': 'Bearer ${_request.authToken}'};
    }
    return null;
  }

  @override
  Future<ApiResponse> syncLocalUpdates({Map<String, dynamic>? extras}) async {
    final updates = await getPendingLocalUpdates();

    if (updates.isEmpty) {
      return ApiResponse.error('No updates found');
    }

    final Map<String, dynamic> updateMap = {};

    if (extras != null) {
      updateMap.addAll(extras);
    }

    updateMap.addAll({'data': updates});

    return _apiClient.post(_request.syncLocalEndpoint, data: updateMap);
  }

  @override
  Future<ApiResponse<DataEntity>> syncRemoteUpdates() {
    return _apiClient.get(_request.syncRemoteEndpoint);
  }

  Future<List<Map<String, dynamic>>> getPendingLocalUpdates() async {
    final box = getBox<DataEntity>();
    final updates = await box.getAllAsync();
    final List<Map<String, dynamic>> pendingUpdates =
        updates.map((data) => data.toJson()).toList();

    return pendingUpdates;
  }

  @override
  Future addRequestExtras(Map<String, dynamic> extras) async {
    this.extras = extras;
  }
}
