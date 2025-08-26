import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_sync/src/blocs/local_updates/local_updates_bloc.dart';
import 'package:flutter_offline_sync/src/data/services/app_config.dart';
import 'package:flutter_offline_sync/src/data/services/configuration_service.dart';
import 'package:flutter_offline_sync/src/data/services/remote_config_service.dart';
import 'package:flutter_offline_sync/src/ui/app_form.dart';
import 'package:flutter_offline_sync/src/utils/formatting.dart';
import 'package:flutter_offline_sync/src/utils/platforms.dart';
import 'package:flutter_offline_sync/src/utils/toast.dart';
import 'package:flutter_offline_sync/src/utils/validations.dart';

class ConfigurationsEdit extends StatefulWidget {
  const ConfigurationsEdit({
    super.key,
    required this.canConfigApi,
    required this.syncUserId,
    required this.isAdmin,
  });
  final bool canConfigApi;
  final String? syncUserId;
  final bool isAdmin;

  @override
  State<ConfigurationsEdit> createState() => _ConfigurationsEditState();
}

class _ConfigurationsEditState extends State<ConfigurationsEdit> {
  final baseUrlController = TextEditingController();
  final uploadUrlController = TextEditingController();
  final downloadUrlController = TextEditingController();
  final addDeviceUrlController = TextEditingController();
  final accountKeyController = TextEditingController();
  final connectAccountEndpointController = TextEditingController();
  final userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_device_config');
  final FocusScopeNode _focusNode = FocusScopeNode();

  @override
  void initState() {
    viewSaveSettings();
    super.initState();
  }

  void handleSaveDevice() async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final repo = RemoteConfigService(apiClient: AppConfig.instance.getClient());
    try {
      final response = await repo.syncCurrentDevice(
        userId: widget.syncUserId,
        userName: userNameController.text.trim(),
        syncUrl: baseUrlController.text.trim(),
        accountKey: accountKeyController.text.trim(),
      );
      if (response.isSuccess) {
        await saveConfig();
      } else {
        if (mounted) context.toast.error('${response.error}');
      }
    } catch (error) {
      if (mounted) context.toast.error('Error saving device: $error');
    }
  }

  Future saveConfig() async {
    final config = AppConfig.instance.getSettings();
    config.baseUrl = formatApiBaseUrl(baseUrlController.text);
    config.localEndpoint = uploadUrlController.text.trim();
    config.remoteEndpoint = downloadUrlController.text.trim();
    config.addSyncDeviceEndpoint = addDeviceUrlController.text.trim();
    config.accountKey = accountKeyController.text.trim();
    config.connectAccountEndpoint = connectAccountEndpointController.text;
    config.userId = widget.syncUserId;
    config.userName = userNameController.text.trim();
    await AppConfig.instance.saveSettings(config);
    if (mounted) {
      context.toast.success('Device synced successfully');
    }
  }

  Future viewSaveSettings() async {
    final settings = AppConfig.instance.getSettings();
    accountKeyController.text = settings.accountKey ?? '';
    baseUrlController.text = settings.baseUrl ?? '';
    uploadUrlController.text = settings.localEndpoint ?? '';
    downloadUrlController.text = settings.remoteEndpoint ?? '';
    addDeviceUrlController.text = settings.addSyncDeviceEndpoint ?? '';
    connectAccountEndpointController.text =
        settings.connectAccountEndpoint ?? '';
    userNameController.text = settings.userName ?? '';
  }

  Future<void> handleDataReset() async {
    await ConfigService.resetSyncDates();
    if (mounted) {
      context.read<LocalUpdatesBloc>().add(FetchLocalChanges());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Device'),
        automaticallyImplyLeading: isMobile(context),
        actions: [
          if (isDesktop(context))
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppForm(
            formKey: _formKey,
            focusNode: _focusNode,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account Key'),
                TextFormField(
                  controller: accountKeyController,
                  validator: Validations.requiredField,
                ),
                Text('Remote Base Url'),
                TextFormField(
                  controller: baseUrlController,
                  validator: Validations.requiredField,
                ),
                if (widget.canConfigApi) ...[
                  Text('Uploads Url'),
                  TextFormField(controller: uploadUrlController),
                  Text('Downloads Url'),
                  TextFormField(controller: downloadUrlController),
                  Text('Add device Url'),
                  TextFormField(controller: addDeviceUrlController),
                  Text('Connect Account Endpoint'),
                  TextFormField(controller: connectAccountEndpointController),
                ],
                Text('User Name'),
                TextFormField(
                  controller: userNameController,
                  validator: Validations.requiredField,
                ),
                SizedBox(height: 10),
                Center(
                  child: FilledButton(
                    onPressed: handleSaveDevice,
                    child: Text('Sync Device'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons:
          widget.isAdmin
              ? [
                Center(
                  child: OutlinedButton.icon(
                    onPressed: handleDataReset,
                    icon: Icon(Icons.restore_outlined),
                    label: Text('Reset Sync Dates'),
                  ),
                ),
              ]
              : null,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
