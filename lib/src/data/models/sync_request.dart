class SyncRequest {
  final String? userId;
  final int? updateId;
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
    int? updateId,
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
