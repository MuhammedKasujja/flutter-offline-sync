import 'package:flutter/material.dart';
import 'package:flutter_offline_sync/src/ui/app_form.dart';
import 'package:flutter_offline_sync/src/utils/validations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/providers/register_device.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';

class DeviceConfiguration extends ConsumerStatefulWidget {
  const DeviceConfiguration({super.key});

  @override
  ConsumerState<DeviceConfiguration> createState() =>
      _DeviceConfigurationState();
}

class _DeviceConfigurationState extends ConsumerState<DeviceConfiguration> {
  final baseUrlController = TextEditingController();
  final usernameController = TextEditingController();
  final accountKeyController = TextEditingController();
  final adminEmailController = TextEditingController();
  final passwordController = TextEditingController();

  static final _formKey = GlobalKey<FormState>(debugLabel: '_device_config');
  final FocusScopeNode _focusNode = FocusScopeNode();

  Future<void> handleRegisterDevice() async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    ref
        .read(registerDeviceProvider.notifier)
        .registerDevice(
          SyncDeviceRequest(
            userId: kDefaultConnectDeviceUserID,
            accountKey: accountKeyController.text.trim(),
            username: usernameController.text.trim(),
            adminEmail: adminEmailController.text.trim(),
            adminPassword: passwordController.text.trim(),
            apiRegisterUrl: baseUrlController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerDeviceProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          context.toast.success('Device registered Successfully!');
        },
        error: (e, _) => context.toast.error('$e'),
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text('Setup Device')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: AppForm(
            focusNode: _focusNode,
            formKey: _formKey,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account Key'),
                TextFormField(
                  controller: accountKeyController,
                  validator: Validations.requiredField,
                ),
                Text('Sync Base Url'),
                TextFormField(
                  controller: baseUrlController,
                  validator: Validations.requiredField,
                ),
                Text('Device Username'),
                TextFormField(
                  controller: usernameController,
                  validator: Validations.requiredField,
                ),
                Text('Admin Email'),
                TextFormField(
                  controller: adminEmailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validations.requiredField,
                ),
                Text('Admin Password'),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: Validations.requiredField,
                ),
                Center(
                  child: FilledButton(
                    onPressed: handleRegisterDevice,
                    child: Text('Sync Device'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
