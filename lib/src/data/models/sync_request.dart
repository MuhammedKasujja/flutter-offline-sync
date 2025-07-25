class SyncRequest {
  final String? userId;
  final String? updateId;
  final String deviceId;
  final String accountKey;
  final List<Map<String, dynamic>> data;
  Map<String, dynamic>? extras;

  SyncRequest({
    this.userId,
    this.updateId,
    required this.deviceId,
    required this.accountKey,
    required this.data,
    this.extras,
  });

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'userId': userId,
      'accountKey': accountKey,
      'updateId': updateId,
      'deviceId': deviceId,
      'extras': extras,
    };
  }

  SyncRequest copyWith({
    String? userId,
    String? updateId,
    String? deviceId,
    String? accountKey,
    List<Map<String, dynamic>>? data,
    Map<String, dynamic>? extras,
  }) {
    return SyncRequest(
      userId: userId ?? this.userId,
      updateId: updateId ?? this.updateId,
      deviceId: deviceId ?? this.deviceId,
      accountKey: accountKey ?? this.accountKey,
      data: data ?? this.data,
      extras: extras ?? this.extras,
    );
  }
}

class SyncDeviceRequest {
  final String? deviceId;
  final String accountKey;
  final String username;
  final String adminEmail;
  final String adminPassword;
  final String apiRegisterUrl;

  SyncDeviceRequest({
    this.deviceId,
    required this.accountKey,
    required this.username,
    required this.adminEmail,
    required this.adminPassword,
    required this.apiRegisterUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'accountKey': accountKey,
      'deviceId': deviceId,
      'username': username,
      'adminEmail': adminEmail,
      'adminPassword': adminPassword,
    };
  }

  SyncDeviceRequest copyWith({
    String? deviceId,
    String? accountKey,
    String? username,
    String? adminEmail,
    String? adminPassword,
    String? apiRegisterUrl,
  }) {
    return SyncDeviceRequest(
      deviceId: deviceId ?? this.deviceId,
      accountKey: accountKey ?? this.accountKey,
      username: username ?? this.username,
      adminEmail: adminEmail ?? this.adminEmail,
      adminPassword: adminPassword ?? this.adminPassword,
      apiRegisterUrl: apiRegisterUrl ?? this.apiRegisterUrl,
    );
  }
}
