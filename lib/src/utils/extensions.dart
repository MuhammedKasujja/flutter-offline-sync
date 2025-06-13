import 'package:flutter/material.dart';

class ToastNotification {
  final BuildContext context;
  ToastNotification(this.context);

  void error(String? error) {
    if (error == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
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
