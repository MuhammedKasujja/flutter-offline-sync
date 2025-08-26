import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/constants.dart';

enum AppLayout { mobile, desktop }

AppLayout calculateLayout(BuildContext context) {
  final size = MediaQuery.of(context).size.width;

  if (size < kMobileLayoutWidth) {
    return AppLayout.mobile;
  } else {
    return AppLayout.desktop;
  }
}

bool isMobile(BuildContext context) =>
    calculateLayout(context) == AppLayout.mobile;

bool isNotMobile(BuildContext context) =>
    calculateLayout(context) != AppLayout.mobile;

bool isDesktop(BuildContext context) =>
    calculateLayout(context) == AppLayout.desktop;
