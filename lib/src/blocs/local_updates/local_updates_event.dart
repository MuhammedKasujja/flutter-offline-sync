part of 'local_updates_bloc.dart';

@freezed
abstract class LocalUpdatesEvent with _$LocalUpdatesEvent {
  factory LocalUpdatesEvent.fetchLocalChanges({DateTime? lastSyncDate}) =
      FetchLocalChanges;
  factory LocalUpdatesEvent.uploadLocalChanges(List<Map<String, dynamic>> data) = UploadLocalChanges;
}
