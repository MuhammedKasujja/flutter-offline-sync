import 'package:bloc/bloc.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_updates_state.dart';
part 'local_updates_event.dart';
part 'local_updates_bloc.freezed.dart';

class LocalUpdatesBloc extends Bloc<LocalUpdatesEvent, LocalUpdatesState> {
  LocalUpdatesBloc() : super(const LocalUpdatesState.initial()) {
    on<FetchLocalUpdates>((event, emit) async {
      emit(LocalUpdatesState.loading());
      try {
        final config = await ConfigService.getSettings();

        if (config != null && config.hasRemoteCredentials) {
          final data = await SyncRepositoryImp().getPendingLocalUpdates();

          emit(LocalUpdatesState.success(data));
        }
      } catch (error) {
        emit(LocalUpdatesState.failure(error));
      }
    });
  }
}
