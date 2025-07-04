import 'package:flutter_offline_sync/src/api/api_client.dart';
import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';

class RemoteConfigService extends IRemoteConfigService {
  final ApiClient apiClient;

  RemoteConfigService({required this.apiClient});

  @override
  Future<ApiResponse> addSyncDevice({required String userId,required String userName}) async {
    final settings = await ConfigService.getSettings();

    if (settings?.addSyncDeviceEndpoint == null) {
      throw Exception(
        'Please configure add sync device endpoint and try again',
      );
    }

    return apiClient.post(
      settings!.addSyncDeviceEndpoint!,
      data: {
        'deviceId': settings.currentDeviceId,
        'accountKey': settings.accountKey,
        'userId': userId,
        'userName': userName,
      },
    );
  }
}

abstract class IRemoteConfigService {
  Future<ApiResponse> addSyncDevice({required String userId,required String userName}) ;
}
