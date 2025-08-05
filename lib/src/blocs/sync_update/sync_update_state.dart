part of 'sync_update_bloc.dart';

@freezed
abstract class SyncUpdateState with _$SyncUpdateState {
  const factory SyncUpdateState.initial({
    required List<DataEntity> remoteUpdates,
  }) = _Initial;
  const factory SyncUpdateState.loading({
    required List<DataEntity> remoteUpdates,
  }) = _LoadInProgress;
  const factory SyncUpdateState.success({
    String? message,
    required List<DataEntity> remoteUpdates,
  }) = _SyncUpdateSucessfully;
  const factory SyncUpdateState.failure({
    required List<DataEntity> remoteUpdates,
    required dynamic error,
  }) = _SyncUpdateFailure;
}
