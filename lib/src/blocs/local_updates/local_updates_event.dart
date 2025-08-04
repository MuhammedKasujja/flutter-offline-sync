part of 'local_updates_bloc.dart';

@freezed
abstract class LocalUpdatesEvent with _$LocalUpdatesEvent {
  factory LocalUpdatesEvent.fetchLocalUpdates({DateTime? lastSyncDate}) =
      FetchLocalUpdates;
}
