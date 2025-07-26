import 'package:flutter/material.dart';
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

  Future<void> handleRegisterDevice() async {
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
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account Key'),
              TextFormField(controller: accountKeyController),
              Text('Sync Base Url'),
              TextFormField(controller: baseUrlController),
              Text('Device Username'),
              TextFormField(controller: usernameController),
              Text('Admin Email'),
              TextFormField(
                controller: adminEmailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Text('Admin Password'),
              TextFormField(controller: passwordController, obscureText: true),
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
    );
  }
}
