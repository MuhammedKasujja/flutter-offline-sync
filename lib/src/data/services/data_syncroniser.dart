import 'dart:convert';

import 'package:flutter_offline_sync/flutter_offline_sync.dart';
import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/interfaces/data_syncroniser.dart';
import 'package:flutter_offline_sync/src/data/interfaces/sync_repository.dart';
import 'package:flutter_offline_sync/src/data/models/models.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

// TODO: Using Isolates to handle data syncronization to remove work on the main thread
class DataSyncroniser extends IDataSyncroniser {
  late final ApiClient _apiClient;
  late final ConfigurationEntity _config;

  late final SyncRepository _syncRepository;

  DataSyncroniser({
    required ApiClient apiClient,
    required ConfigurationEntity config,
    required SyncRepository syncRepository,
  }) : _apiClient = apiClient,
       _config = config,
       _syncRepository = syncRepository;

  @override
  Future<ApiResponse> syncLocalUpdates({Map<String, dynamic>? extras}) async {
    final updates = await _syncRepository.getPendingLocalUpdates();

    if (updates.isEmpty) {
      return ApiResponse.error('No updates found');
    }

    final Map<String, dynamic> updateMap = {};

    if (_config.accountKey == null) {
      throw Exception('Account key is required to sync updates');
    }

    if (extras != null) {
      updateMap.addAll(extras);
    }

    updateMap.addAll({'data': updates});

    updateMap.addAll({
      "userId": _config.userId ?? '5600',
      "updateId": 560,
      'deviceId': _config.currentDeviceId,
      'accountKey': _config.accountKey,
    });

    return _apiClient.post(_config.localEndpoint!, data: updateMap);
  }

  @override
  Future<void> syncRemoteUpdates(List<DataEntity> remoteUpdates) async {
    if (remoteUpdates.isEmpty) {
      logger.info('No Remote updates found');
      return;
    }
    for (var remoteData in remoteUpdates) {
      /// updating local database with remote changes
      FlutterSync.instance.entityRegistry.save(
        remoteData.entity,
        jsonDecode(remoteData.data),
      );
    }
  }

  @override
  Future addRequestExtras(Map<String, dynamic> extras) async {}

  @override
  Future<void> clearUpdatesTable() async {
    return _syncRepository.clearUpdatesTable();
  }

  @override
  Future<ApiResponse<List<DataEntity>>> fetchRemoteUpdates() async {
    logger.info('Getting remote updates');
    try {
      if (!_config.hasAccountKey) {
        throw Exception('Account key is required to sync updates');
      }

      if (!_config.hasCurrentDeviceId) {
        throw Exception('Device must be registered to sync updates');
      }

      if (!_config.hasConfiguredRemoteEndpoint) {
        throw Exception('Remote sync endpoint is not configured');
      }

      final response = await _apiClient.get(
        _config.remoteEndpoint!,
        queryParameters: {
          'deviceId': _config.currentDeviceId,
          'accountKey': _config.accountKey,
        },
      );
      logger.info(response.data);
      if (response.isSuccess) {
        final updatesList = (response.data as List).map(
          (json) => DataEntity.fromJson(json),
        );
        return ApiResponse(
          success: response.isSuccess,
          data: updatesList.toList(),
        );
      }
      return ApiResponse.error(response.error);
    } catch (error, stackTrace) {
      logger.error({error, stackTrace});
      return ApiResponse.error(error.toString());
    }
  }
}
