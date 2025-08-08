import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class DeviceConfigServiceImpl extends DeviceConfigService {
  DeviceConfigServiceImpl({required super.apiClient});

  @override
  Future<ApiResponse> registerDevice(SyncDeviceRequest request) async {
    var config = await ConfigService.getRefreshedConfig();
    final requestModel = request.copyWith(
      deviceId: config!.currentDeviceId!,
      userId: request.userId,
    );

    final connectAccountUrl = formattedBaseUrl(
      baseUrl: request.apiRegisterUrl,
      endpoint: config.connectAccountEndpoint,
    );

    final reseponse = await apiClient.post(
      connectAccountUrl,
      data: requestModel.toJson(),
    );

    if (reseponse.isSuccess) {
      config = config.copyWith(
        accountKey: request.accountKey,
        baseUrl: formatApiBaseUrl(request.apiRegisterUrl),
        userName: request.username,
        userId: request.userId,
      );
      await ConfigService.saveSettings(config);
    }

    return reseponse;
  }
}
