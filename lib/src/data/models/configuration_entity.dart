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
  String? authToken;
  String? userId;
  String? extras;

  ConfigurationEntity({
    this.id = 0,
    this.currentDeviceId,
    this.accountKey,
    this.baseUrl,
    this.remoteEndpoint,
    this.localEndpoint,
    this.addSyncDeviceEndpoint,
    this.authToken,
    this.userId,
    this.extras,
  });

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ConfigurationEntity(
        currentDeviceId: json['currentDeviceId'],
        accountKey: json['accountKey'],
        authToken: json['authToken'],
        userId: json['userId'],
        extras: json['extras'],
      );

  Map<String, dynamic> toJson() {
    return {
      "currentDeviceId": currentDeviceId,
      "accountKey": accountKey,
      "authToken": authToken,
      "userId": userId,
      "extras": extras,
      "baseUrl": baseUrl,
      "remoteEndpoint": remoteEndpoint,
      "localEndpoint": localEndpoint,
      "addSyncDeviceEndpoint": addSyncDeviceEndpoint,
    };
  }

  bool get hasRemoteCredentials =>
      (accountKey ?? '').isNotEmpty &&
      (baseUrl ?? '').isNotEmpty &&
      (remoteEndpoint ?? '').isNotEmpty &&
      (localEndpoint ?? '').isNotEmpty &&
      (addSyncDeviceEndpoint ?? '').isNotEmpty;
}
