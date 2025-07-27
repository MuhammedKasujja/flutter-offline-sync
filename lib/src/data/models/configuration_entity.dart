// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  String? connectAccountEndpoint;
  String? userName;
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
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  bool isSynced;

  ConfigurationEntity({
    this.id = 0,
    this.isSynced = false,
    this.currentDeviceId,
    this.accountKey,
    this.baseUrl,
    this.remoteEndpoint,
    this.localEndpoint,
    this.addSyncDeviceEndpoint,
    this.connectAccountEndpoint,
    this.authToken,
    this.userName,
    this.userId,
    this.extras,
    this.localLastUpdatedAt,
    this.remoteLastUpdatedAt,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
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
      "id": id,
      "currentDeviceId": currentDeviceId,
      "accountKey": accountKey,
      "userName": userName,
      "authToken": authToken,
      "userId": userId,
      "extras": extras,
      "baseUrl": baseUrl,
      "remoteEndpoint": remoteEndpoint,
      "localEndpoint": localEndpoint,
      "addSyncDeviceEndpoint": addSyncDeviceEndpoint,
      "localLastUpdatedAt": localLastUpdatedAt?.millisecondsSinceEpoch,
      "remoteLastUpdatedAt": remoteLastUpdatedAt?.millisecondsSinceEpoch,
      "connectAccountEndpoint": connectAccountEndpoint,
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

  bool get hasSyncDeviceEndpoint => (addSyncDeviceEndpoint ?? '').isNotEmpty;

  bool get hasConnectAccountEndpoint =>
      (connectAccountEndpoint ?? '').isNotEmpty;

  ConfigurationEntity copyWith({
    String? currentDeviceId,
    String? accountKey,
    String? baseUrl,
    String? remoteEndpoint,
    String? localEndpoint,
    String? addSyncDeviceEndpoint,
    String? connectAccountEndpoint,
    String? authToken,
    String? userName,
    String? userId,
    String? extras,
    DateTime? localLastUpdatedAt,
    DateTime? remoteLastUpdatedAt,
    DateTime? updatedAt,
    DateTime? createdAt,
    DateTime? deletedAt,
    bool? isSynced,
  }) {
    return ConfigurationEntity(
      id: id,
      connectAccountEndpoint:
          connectAccountEndpoint ?? this.connectAccountEndpoint,
      currentDeviceId: currentDeviceId ?? this.currentDeviceId,
      accountKey: accountKey ?? this.accountKey,
      baseUrl: baseUrl ?? this.baseUrl,
      remoteEndpoint: remoteEndpoint ?? this.remoteEndpoint,
      localEndpoint: localEndpoint ?? this.localEndpoint,
      addSyncDeviceEndpoint:
          addSyncDeviceEndpoint ?? this.addSyncDeviceEndpoint,
      authToken: authToken ?? this.authToken,
      userId: userId ?? this.userId,
      extras: extras ?? this.extras,
      localLastUpdatedAt: localLastUpdatedAt ?? this.localLastUpdatedAt,
      remoteLastUpdatedAt: remoteLastUpdatedAt ?? this.remoteLastUpdatedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isSynced: isSynced ?? this.isSynced,
      userName: userName ?? this.userName,
    );
  }

  /// Configure to `Default settings` if no `Settings` are set
  ConfigurationEntity syncIfNull({
    String? currentDeviceId,
    String? remoteEndpoint,
    String? localEndpoint,
    String? addSyncDeviceEndpoint,
    String? connectAccountEndpoint,
    String? baseUrl,
    String? accountKey,
  }) {
    return ConfigurationEntity(
      id: id,
      remoteEndpoint:
          hasConfiguredRemoteEndpoint ? this.remoteEndpoint : remoteEndpoint,
      localEndpoint:
          hasConfiguredLocalEndpoint ? this.localEndpoint : localEndpoint,
      addSyncDeviceEndpoint:
          hasSyncDeviceEndpoint
              ? this.addSyncDeviceEndpoint
              : addSyncDeviceEndpoint,
      connectAccountEndpoint:
          hasConnectAccountEndpoint
              ? this.connectAccountEndpoint
              : connectAccountEndpoint,
      currentDeviceId:
          hasCurrentDeviceId ? this.currentDeviceId : currentDeviceId,
      accountKey: hasAccountKey ? this.accountKey : accountKey,
      baseUrl: (baseUrl ?? '').isNotEmpty ? this.baseUrl : baseUrl,
      authToken: authToken,
      userId: userId,
      extras: extras,
      localLastUpdatedAt: localLastUpdatedAt,
      remoteLastUpdatedAt: remoteLastUpdatedAt,
      updatedAt: updatedAt,
      createdAt: createdAt,
      deletedAt: deletedAt,
      isSynced: isSynced,
      userName: userName,
    );
  }
}
