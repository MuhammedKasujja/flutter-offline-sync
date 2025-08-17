part of 'sync_update_bloc.dart';

@freezed
sealed class SyncUpdateEvent with _$SyncUpdateEvent {
  factory SyncUpdateEvent.saveRemoteUpdates({
    required List<SyncDataEntity> remoteUpdates,
  }) = SaveRemoteUpdates;
  factory SyncUpdateEvent.syncUpdate({required SyncDataEntity remoteUpdate}) =
      SyncSingleUpdate;
  factory SyncUpdateEvent.stageRemoteChanges() = StageRemoteChanges;
  factory SyncUpdateEvent.persistRemoteChangesManually() =
      PersistRemoteChangesManually;
}
