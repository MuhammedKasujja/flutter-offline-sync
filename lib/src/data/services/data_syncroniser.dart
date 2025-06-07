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

  final Map<String, dynamic>? _extras;

  DataSyncroniser({required SyncRequest request, Map<String, dynamic>? extras})
    : _request = request,
      _extras = extras {
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
    if (_request.authToken != null && _request.authToken!.isNotEmpty) {
      return {'Authorization': 'Bearer ${_request.authToken}'};
    }
    return null;
  }

  @override
  Future<ApiResponse> syncLocalUpdates() async {
    final updates = await getPendingLocalUpdates();

    if (updates.isEmpty) {
      return ApiResponse.error('No updates found');
    }

    final Map<String, dynamic> updateMap = {'data': updates};

    if (_extras != null) {
      updateMap.addAll(_extras);
    }

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
}
