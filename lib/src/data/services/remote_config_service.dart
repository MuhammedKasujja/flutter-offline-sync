import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';

class RemoteConfigService extends IRemoteConfigService {
  final ApiClient apiClient;

  RemoteConfigService({required this.apiClient});

  @override
  Future<ApiResponse> syncCurrentDevice({
    required String? userId,
    required String userName,
    required String syncUrl,
  }) async {
    final settings = await ConfigService.getSettings();

    if (settings?.addSyncDeviceEndpoint == null) {
      throw Exception(
        'Please configure add sync device endpoint and try again',
      );
    }
    final url = formattedBaseUrl(
      baseUrl: syncUrl,
      endpoint: settings!.addSyncDeviceEndpoint!,
    );
    logger.debug(url);
    return apiClient.post(
      url,
      data: {
        'deviceId': settings.currentDeviceId,
        'accountKey': settings.accountKey,
        'userId': userId,
        'userName': userName,
      },
    );
  }

  @override
  Future<ApiResponse> deleteSyncDevice({required String deviceId}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getSyncDevices() async {
    final settings = await ConfigService.getSettings();
    return apiClient.get(settings!.addSyncDeviceEndpoint!);
  }

  @override
  Future<ApiResponse> addSyncDevice({
    required String userId,
    required String deviceId,
    required String userName,
  }) async {
    final settings = await ConfigService.getSettings();
    return apiClient.post(
      settings!.addSyncDeviceEndpoint!,
      data: {
        'deviceId': deviceId,
        'accountKey': settings.accountKey,
        'userId': userId,
        'userName': userName,
      },
    );
  }
}

abstract class IRemoteConfigService {
  Future<ApiResponse> addSyncDevice({
    required String userId,
    required String deviceId,
    required String userName,
  });
  Future<ApiResponse> getSyncDevices();
  Future<ApiResponse> deleteSyncDevice({required String deviceId});
  Future<ApiResponse> syncCurrentDevice({
    required String? userId,
    required String userName,
    required String syncUrl,
  });
}
