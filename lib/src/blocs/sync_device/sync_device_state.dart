part of 'sync_device_bloc.dart';

@freezed
abstract class SyncDeviceState with _$SyncDeviceState {
  const factory SyncDeviceState.initial({
    @Default([]) List<SyncDeviceEntity> data,
  }) = _Initial;
  const factory SyncDeviceState.loading({
    @Default([]) List<SyncDeviceEntity> data,
  }) = _InProgress;
  const factory SyncDeviceState.success({required List<SyncDeviceEntity> data}) =
      _Success;
  const factory SyncDeviceState.failure(
    dynamic error, {
    @Default([]) List<SyncDeviceEntity> data,
  }) = _Failure;
}
