import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/blocs.dart';
import 'package:flutter_offline_sync/src/constants.dart';
import 'package:flutter_offline_sync/src/data/models/sync_request.dart';
import 'package:flutter_offline_sync/src/ui/app_form.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';
import 'package:flutter_offline_sync/src/utils/validations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceConfigurationForm extends ConsumerStatefulWidget {
  const DeviceConfigurationForm({super.key});

  @override
  ConsumerState<DeviceConfigurationForm> createState() =>
      _DeviceConfigurationFormState();
}

class _DeviceConfigurationFormState
    extends ConsumerState<DeviceConfigurationForm> {
  final baseUrlController = TextEditingController();
  final usernameController = TextEditingController();
  final accountKeyController = TextEditingController();
  final adminEmailController = TextEditingController();
  final passwordController = TextEditingController();

  static final _formKey = GlobalKey<FormState>(
    debugLabel: '_device_config_form',
  );
  final FocusScopeNode _focusNode = FocusScopeNode();

  Future<void> handleRegisterDevice() async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    if (!mounted) return;
    context.read<DeviceConfigurationBloc>().add(
      RegisterDevice(
        SyncDeviceRequest(
          userId: kDefaultConnectDeviceUserID,
          accountKey: accountKeyController.text.trim(),
          username: usernameController.text.trim(),
          adminEmail: adminEmailController.text.trim(),
          adminPassword: passwordController.text.trim(),
          apiRegisterUrl: baseUrlController.text.trim(),
        ),
      ),
    );
  }

  void handleAfterDeviceConfigured(
    BuildContext context,
    DeviceConfigurationState state,
  ) {
    state.whenOrNull(
      success: (message, configStep) {
        context.read<RemoteUpdatesBloc>().add(FetchRemotePendingUpdates());
      },
      error: (configStep, error) => context.toast.error(error.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Setup Device'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              BlocListener<DeviceConfigurationBloc, DeviceConfigurationState>(
                listener: handleAfterDeviceConfigured,
                child: Center(
                  child: FilledButton(
                    onPressed: handleRegisterDevice,
                    child: Text('Sync Device'),
                  ),
                ),
              ),
            ],
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
