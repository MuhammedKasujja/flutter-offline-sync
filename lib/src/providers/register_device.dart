import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service_impl.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_device.g.dart';

@riverpod
class RegisterDevice extends _$RegisterDevice {
  @override
  FutureOr<void> build() {}

  Future<void> registerDevice(SyncDeviceRequest request) async {
    state = const AsyncLoading();
    try {
      final response = await DeviceConfigServiceImpl(
        apiClient: AppConfig.instance.getClient(),
      ).registerDevice(request);
      if (!response.isSuccess) {
        throw Exception(response.error ?? 'Unknown error');
      }
      state = AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      logger.error(error);
    }
  }
}
