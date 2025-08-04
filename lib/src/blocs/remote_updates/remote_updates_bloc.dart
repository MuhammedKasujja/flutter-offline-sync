import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_updates_state.dart';
part 'remote_updates_event.dart';
part 'remote_updates_bloc.freezed.dart';

class RemoteUpdatesBloc extends Bloc<RemoteUpdatesEvent,RemoteUpdatesState>{
  RemoteUpdatesBloc() : super(const RemoteUpdatesState.initial()){
    
  }
}