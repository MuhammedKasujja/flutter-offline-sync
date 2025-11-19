import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';

class ToastNotification {
  final BuildContext context;
  ToastNotification(this.context);

  void error(dynamic error) {
    final message = formatError(error);
    // showToastAboveEverything(context, 'fhdfdjbf f dfdifdjfhdkjfdfjkdfbnd. fdjhfhjkdfdkjfdfjdkjfd dfhjdhfjdjhfdjhfd fdjfhhjfhdfjhdfhdhfdhjfhdjfdhfdhjfhdf. fdgjfdhfhdjfjhdhfjd fdjdjfhdjfhdfhdfjhdfd hbfdghjfhdfdhjfhdjfjdhfhdfhd fgdfjhdhfjhdfhdhjfdhfhdjfhdfhdhjfjhdhfd', false);
    showToastAboveEverything(context, message, false);
    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(SnackBar(content: Text(message)));
  }

  void success(String? message) {
    if (message == null) return;
    showToastAboveEverything(context, message, true);
  }
}

extension ToastNotificationX on BuildContext {
  ToastNotification get toast => ToastNotification(this);
}

void showToastAboveEverything(
  BuildContext context,
  String message,
  bool isSuccess,
) {
  final overlay = Overlay.of(context, rootOverlay: true);
  final overlayEntry = OverlayEntry(
    builder:
        (_) => SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      if (isSuccess)
                        Icon(Icons.done_all_outlined, color: Colors.green,)
                      else
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      Expanded(
                        child: Text(
                          message,
                          style: Theme.of(context).dialogTheme.contentTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
