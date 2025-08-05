part of 'internet_connection_bloc.dart';

@freezed
abstract class InternetConnectionState with _$InternetConnectionState {
  factory InternetConnectionState.idle() = _Idle;
  factory InternetConnectionState.connected() = _Connected;
  factory InternetConnectionState.offline() = _Offline;
  factory InternetConnectionState.noInternet() = _NoInternet;
}
