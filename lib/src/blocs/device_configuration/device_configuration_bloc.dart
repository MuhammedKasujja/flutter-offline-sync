import 'package:bloc/bloc.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service_impl.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_configuration_state.dart';
part 'device_configuration_event.dart';
part 'device_configuration_bloc.freezed.dart';

class DeviceConfigurationBloc
    extends Bloc<DeviceConfigurationEvent, DeviceConfigurationState> {
  DeviceConfigurationBloc() : super(const DeviceConfigurationState.initial()) {
    on<RegisterDevice>((event, emit) async {
      try {
        emit(DeviceConfigurationState.loading());
        final response = await DeviceConfigServiceImpl(
          apiClient: AppConfig.instance.getClient(),
        ).registerDevice(event.requestDetails);
        if (!response.isSuccess) {
          throw Exception(response.error ?? 'Unknown error');
        }

        /// refresh global settings after saving device
        /// TODO: use dependence injection to avoid refreshing the global settings
        AppConfig.instance.restart();
        emit(
          DeviceConfigurationState.success(
            message: 'Device registered Successfully!',
          ),
        );
      } catch (error, stackTrace) {
        emit(DeviceConfigurationState.error(error));
        logger.error(stackTrace);
      }
    });
  }
}
