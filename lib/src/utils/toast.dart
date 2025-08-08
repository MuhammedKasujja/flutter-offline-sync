import 'package:flutter/material.dart';

class ToastNotification {
  final BuildContext context;
  ToastNotification(this.context);

  void error(dynamic error) {
    if (error == null || error.toString().isEmpty) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error.toString())));
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
