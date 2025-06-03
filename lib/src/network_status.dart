import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_status.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> networkStatus(Ref ref) async* {
  final connectivity = Connectivity();
  final controller = StreamController<bool>();

  // Initial check
  controller.add(await _hasInternet());

  // Listen to connectivity changes
  final sub = connectivity.onConnectivityChanged.listen((_) async {
    controller.add(await _hasInternet());
  });

  // Optional: periodic re-check (e.g., every 15s) in case system doesn’t emit events
  final timer = Timer.periodic(const Duration(seconds: 5), (_) async {
    controller.add(await _hasInternet());
  });

  ref.onDispose(() {
    sub.cancel();
    timer.cancel();
    controller.close();
  });

  yield* controller.stream.distinct(); // emits only if changed
}

Future<bool> _hasInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
  } on SocketException {
    return false;
  }
}
