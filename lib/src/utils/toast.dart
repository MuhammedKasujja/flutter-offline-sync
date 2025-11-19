import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class ToastNotification {
  final BuildContext context;
  ToastNotification(this.context);

  void error(dynamic error) {
    final message = formatError(error);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void success(String? message) {
    if (message == null) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

extension ToastNotificationX on BuildContext {
  ToastNotification get toast => ToastNotification(this);
}
