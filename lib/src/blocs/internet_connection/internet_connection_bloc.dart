import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_offline_sync/src/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';
part 'internet_connection_bloc.freezed.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  static const _pingHost = 'google.com';
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  InternetConnectionBloc() : super(InternetConnectionState.idle()) {
    on<CheckConnectivity>(_onCheckConnectivity);
    on<ConnectivityChanged>(_onConnectivityChanged);
  }

  Future<void> _onCheckConnectivity(
    CheckConnectivity event,
    Emitter<InternetConnectionState> emit,
  ) async {
    try {
      // Check current connectivity immediately
      final current = await Connectivity().checkConnectivity();
      add(ConnectivityChanged(current.first));

      // Cancel previous subscription
      await _subscription?.cancel();

      // Listen to connectivity changes
      _subscription = Connectivity().onConnectivityChanged.listen((results) {
        if (results.isNotEmpty) {
          add(ConnectivityChanged(results.first));
        }
      });
    } catch (error) {
      logger.error({'InternetError': error});
      emit(InternetConnectionState.noInternet());
    }
  }

  Future<void> _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<InternetConnectionState> emit,
  ) async {
    if (event.connectivity == ConnectivityResult.mobile ||
        event.connectivity == ConnectivityResult.wifi) {
      final hasInternet = await _hasActiveInternet();
      emit(
        hasInternet
            ? InternetConnectionState.connected()
            : InternetConnectionState.noInternet(),
      );
    } else {
      emit(InternetConnectionState.offline());
    }
  }

  Future<bool> _hasActiveInternet() async {
    try {
      final result = await InternetAddress.lookup(
        _pingHost,
      ).timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      logger.error('No internet (Socket): $e');
    } on TimeoutException catch (e) {
      logger.error('No internet (Timeout): $e');
    }
    return false;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
