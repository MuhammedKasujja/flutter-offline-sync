import 'package:flutter/material.dart';

class AppForm extends StatelessWidget {
  const AppForm({
    super.key,
    required this.child,
    required this.formKey,
    required this.focusNode,
  });

  final GlobalKey<FormState> formKey;
  final Widget child;
  final FocusScopeNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return FocusScope(node: focusNode, child: Form(key: formKey, child: child));
  }
}
