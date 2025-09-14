import 'package:flutter_offline_sync/src/api/api_response.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service.dart';
import 'package:flutter_offline_sync/src/utils/data.dart';
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

  @override
  Future<ApiResponse<List<SyncDeviceEntity>>> fetchAccountDevices() async {
    var config = await ConfigService.getSettings();
    final response = await apiClient.getList(
      url: formattedBaseUrl(
        baseUrl: config!.baseUrl!,
        endpoint: config.syncDeviceListEndpoint!,
      ),
      queryParams: {'accountKey': config.accountKey},
      converter: (json) => SyncDeviceEntity.fromJson(json),
    );
    if (response.isSuccess && response.data != null) {
      await removeAllDevices();
      response.data!
          .map((e) => e.save())
          .whereType<SyncDeviceEntity>()
          .toList();
      return response;
    }
    return ApiResponse<List<SyncDeviceEntity>>(
      error: response.error,
      success: false,
    );
  }

  @override
  Future<int> removeAllDevices() async {
    return getBox<SyncDeviceEntity>().removeAllAsync();
  }

  @override
  Future<List<SyncDeviceEntity>> fetchLocalSaveDevices() {
    return getBox<SyncDeviceEntity>().getAllAsync();
  }
}
