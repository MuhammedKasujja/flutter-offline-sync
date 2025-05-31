class SyncRequest {
  final String baseUrl;
  final String syncRemoteEndpoint;
  final String syncLocalEndpoint;
  final String? authToken;

  SyncRequest({
    required this.baseUrl,
    required this.syncRemoteEndpoint,
    required this.syncLocalEndpoint,
    required this.authToken,
  }); 
}
