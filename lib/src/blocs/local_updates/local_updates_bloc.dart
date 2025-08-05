import 'package:bloc/bloc.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/sync_repository.dart';
import 'package:flutter_offline_sync/src/data/services/syncroniser_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_updates_state.dart';
part 'local_updates_event.dart';
part 'local_updates_bloc.freezed.dart';

class LocalUpdatesBloc extends Bloc<LocalUpdatesEvent, LocalUpdatesState> {
  LocalUpdatesBloc() : super(const LocalUpdatesState.initial()) {
    on<FetchLocalChanges>((event, emit) async {
      try {
        emit(LocalUpdatesState.loading());
        final config = await ConfigService.getSettings();

        if (config != null && config.hasRemoteCredentials) {
          final data = await SyncRepositoryImp().getPendingLocalUpdates();

          emit(LocalUpdatesState.success(data));
        } else {
          throw Exception(
            'Please setup the device/ account to enable uploading changes',
          );
        }
      } catch (error) {
        emit(LocalUpdatesState.failure(error));
      }
    });
    on<UploadLocalChanges>((event, emit) async {
      try {
        emit(LocalUpdatesState.loading());
        final config = await ConfigService.getSettings();

        if (config != null && config.hasRemoteCredentials) {
          final syncId = '9000-${DateTime.now().millisecondsSinceEpoch}';

          await SyncroniserService(
            AppConfig.instance.syncronizer,
          ).syncLocalChanges(syncId);

          emit(LocalUpdatesState.uploaded('Changes Uploaded Successfully'));
        }
      } catch (error) {
        emit(LocalUpdatesState.failure(error));
      }
    });
  }
}
