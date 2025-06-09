import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/interfaces/sync_repository.dart';
import 'package:flutter_offline_sync/src/data/models/data_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

// TODO: Using Isolates to handle data syncronization to remove work on the main thread
class DataSyncroniser extends IDataSyncroniser {
  final SyncRequest _request;

  late final ApiClient _apiClient;

  Map<String, dynamic>? extras;

  late final ISyncRepository _syncRepository;

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
    _syncRepository = SyncRepository();
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
    final updates = await _syncRepository.getPendingLocalUpdates();

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
  Future<void> syncRemoteUpdates(List<DataEntity> updates) async {
    if (updates.isEmpty) {
      logger.info('No updates found');
      return;
    }
    for (var remoteData in updates) {
      FlutterSync.instance.entityRegistry.save(
        remoteData.entity,
        // TODO: pass this as JSON and make sure all models have fromJson method
        jsonDecode(remoteData.data),
      );
    }
  }

  @override
  Future addRequestExtras(Map<String, dynamic> extras) async {
    this.extras = extras;
  }

  @override
  Future<void> clearUpdatesTable() async {
    return _syncRepository.clearUpdatesTable();
  }

  @override
  Future<ApiResponse<List<DataEntity>>> fetchRemoteUpdates() {
    return _apiClient.get(_request.syncRemoteEndpoint);
  }
}
