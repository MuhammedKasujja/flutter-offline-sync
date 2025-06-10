import 'package:objectbox/objectbox.dart';

@Entity()
class ConfigurationEntity {
  @Id()
  int id;
  String? currentDeviceId;
  String? accountKey;
  String? baseUrl;
  String? remoteEndpoint;
  String? localEndpoint;
  String? addSyncDeviceEndpoint;

  ConfigurationEntity({
    this.id = 0,
    this.currentDeviceId,
    this.accountKey,
    this.baseUrl,
    this.remoteEndpoint,
    this.localEndpoint,
    this.addSyncDeviceEndpoint,
  });

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ConfigurationEntity(
        currentDeviceId: json['currentDeviceId'],
        accountKey: json['accountKey'],
      );
}
