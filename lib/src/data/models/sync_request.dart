class SyncRequest {
  final String baseUrl;
  final String syncRemoteEndpoint;
  final String syncLocalEndpoint;
  String? authToken;

  SyncRequest({
    required this.baseUrl,
    required this.syncRemoteEndpoint,
    required this.syncLocalEndpoint,
    this.authToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'authToken': authToken,
      'syncRemoteEndpoint': syncRemoteEndpoint,
      'syncLocalEndpoint': syncLocalEndpoint,
    };
  }
}
