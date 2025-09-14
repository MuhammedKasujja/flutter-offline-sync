class RegisterDeviceDTO {
  final String? userId;
  final String? deviceId;
  final String accountKey;
  final String userName;
  final String? adminEmail;
  final String? adminPassword;
  final String? localEndpoint;
  final String? remoteEndpoint;
  final String? addSyncDeviceEndpoint;
  final String? syncDeviceListEndpoint;
  final String? connectAccountEndpoint;
  final String syncUrl;

  RegisterDeviceDTO({
    this.userId,
    this.deviceId,
    required this.accountKey,
    required this.userName,
    this.adminEmail,
    this.adminPassword,
    required this.syncUrl,
    this.localEndpoint,
    this.remoteEndpoint,
    this.addSyncDeviceEndpoint,
    this.connectAccountEndpoint,
    this.syncDeviceListEndpoint,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'deviceId': deviceId,
      'accountKey': accountKey,
      'userName': userName,
      'adminEmail': adminEmail,
      'adminPassword': adminPassword,
      'localEndpoint': localEndpoint,
      'remoteEndpoint': remoteEndpoint,
      'addSyncDeviceEndpoint': addSyncDeviceEndpoint,
      'connectAccountEndpoint': connectAccountEndpoint,
      'syncDeviceListEndpoint': syncDeviceListEndpoint,
    };
  }

  RegisterDeviceDTO copyWith({
    String? userId,
    String? deviceId,
    String? accountKey,
    String? userName,
    String? adminEmail,
    String? adminPassword,
    String? syncUrl,
  }) {
    return RegisterDeviceDTO(
      userId: userId ?? this.userId,
      deviceId: deviceId ?? this.deviceId,
      accountKey: accountKey ?? this.accountKey,
      userName: userName ?? this.userName,
      adminEmail: adminEmail ?? this.adminEmail,
      adminPassword: adminPassword ?? this.adminPassword,
      syncUrl: syncUrl ?? this.syncUrl,
      localEndpoint: localEndpoint,
      remoteEndpoint: remoteEndpoint,
      addSyncDeviceEndpoint: addSyncDeviceEndpoint,
      connectAccountEndpoint: connectAccountEndpoint,
      syncDeviceListEndpoint: syncDeviceListEndpoint,
    );
  }
}
