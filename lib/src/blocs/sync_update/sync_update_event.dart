part of 'sync_update_bloc.dart';

@freezed
sealed class SyncUpdateEvent with _$SyncUpdateEvent {
  factory SyncUpdateEvent.saveRemoteUpdates({
    required List<DataEntity> remoteUpdates,
  }) = SaveRemoteUpdates;
  factory SyncUpdateEvent.syncUpdate({required DataEntity remoteUpdate}) =
      SyncSingleUpdate;
}
