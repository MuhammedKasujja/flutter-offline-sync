import 'package:bloc/bloc.dart';
import 'package:flutter_offline_sync/src/data/models/sync_device_entity.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/device/device_config_service_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_device_state.dart';
part 'sync_device_event.dart';
part 'sync_device_bloc.freezed.dart';

class SyncDeviceBloc extends Bloc<SyncDeviceEvent, SyncDeviceState> {
  SyncDeviceBloc() : super(const SyncDeviceState.initial()) {
    on<_FetchLocalDevices>((event, emit) async {
      emit(SyncDeviceState.loading(data: state.data));
      try {
        final devices =
            await DeviceConfigServiceImpl(
              apiClient: AppConfig.instance.getClient(),
            ).fetchLocalSaveDevices();

        emit(SyncDeviceState.success(data: devices));
      } catch (error) {
        emit(SyncDeviceState.failure(error, data: state.data));
      }
    });
    on<_FetchRemoteDevices>((event, emit) async {
      emit(SyncDeviceState.loading(data: state.data));
      try {
        final response =
            await DeviceConfigServiceImpl(
              apiClient: AppConfig.instance.getClient(),
            ).fetchAccountDevices();

        if (!response.isSuccess) {
          throw Exception(response.error ?? 'Unknown error occured');
        }
        emit(SyncDeviceState.success(data: response.data ?? []));
      } catch (error) {
        emit(SyncDeviceState.failure(error, data: state.data));
      }
    });
  }
}
