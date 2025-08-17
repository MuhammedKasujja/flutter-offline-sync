part of 'sync_update_bloc.dart';

@freezed
abstract class SyncUpdateState with _$SyncUpdateState {
  const factory SyncUpdateState.initial({
    required List<SyncDataEntity> remoteUpdates,
  }) = _Initial;
  const factory SyncUpdateState.loading({
    required List<SyncDataEntity> remoteUpdates,
  }) = _LoadInProgress;
  const factory SyncUpdateState.success({
    String? message,
    required List<SyncDataEntity> remoteUpdates,
  }) = _SyncUpdateSucessfully;
  const factory SyncUpdateState.stagedChanges({
    required List<SyncDataEntity> remoteUpdates,
  }) = _SyncStagedChanges;
  const factory SyncUpdateState.error({
    required List<SyncDataEntity> remoteUpdates,
    required dynamic error,
  }) = _SyncUpdateFailure;
}
