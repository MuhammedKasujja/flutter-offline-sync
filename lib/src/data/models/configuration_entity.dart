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
  @Property(type: PropertyType.date)
  DateTime? localLastUpdatedAt;
  @Property(type: PropertyType.date)
  DateTime? remoteLastUpdatedAt;
  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime? createdAt;

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
    this.localLastUpdatedAt,
    this.remoteLastUpdatedAt,
    this.updatedAt,
    this.createdAt,
  });

  factory ConfigurationEntity.fromJson(
    Map<String, dynamic> json,
  ) => ConfigurationEntity(
    currentDeviceId: json['currentDeviceId'],
    accountKey: json['accountKey'],
    authToken: json['authToken'],
    userId: json['userId'],
    extras: json['extras'],
    localLastUpdatedAt:
        json['localLastUpdatedAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['localLastUpdatedAt'])
            : null,
    remoteLastUpdatedAt:
        json['remoteLastUpdatedAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['remoteLastUpdatedAt'])
            : null,
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
      "localLastUpdatedAt": localLastUpdatedAt?.millisecondsSinceEpoch,
      "remoteLastUpdatedAt": remoteLastUpdatedAt?.millisecondsSinceEpoch,
    };
  }

  bool get hasRemoteCredentials =>
      hasAccountKey &&
      (baseUrl ?? '').isNotEmpty &&
      hasConfiguredRemoteEndpoint &&
      hasConfiguredLocalEndpoint &&
      (addSyncDeviceEndpoint ?? '').isNotEmpty;

  bool get hasSyncedLocalBefore => localLastUpdatedAt != null;

  bool get hasSyncedRemoteBefore => remoteLastUpdatedAt != null;

  bool get hasAccountKey => (accountKey ?? '').isNotEmpty;

  bool get hasCurrentDeviceId => (currentDeviceId ?? '').isNotEmpty;

  bool get hasAuthToken => (authToken ?? '').isNotEmpty;

  bool get hasUserId => (userId ?? '').isNotEmpty;

  bool get hasConfiguredRemoteEndpoint => (remoteEndpoint ?? '').isNotEmpty;

  bool get hasConfiguredLocalEndpoint => (localEndpoint ?? '').isNotEmpty;
}
