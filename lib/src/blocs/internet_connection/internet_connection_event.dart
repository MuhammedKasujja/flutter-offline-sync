part of 'internet_connection_bloc.dart';

@freezed
abstract class InternetConnectionEvent with _$InternetConnectionEvent {
  factory InternetConnectionEvent.checkConnectivity() = CheckConnectivity;
  factory InternetConnectionEvent.connectivityChanged(
    ConnectivityResult connectivity,
  ) = ConnectivityChanged;
}
