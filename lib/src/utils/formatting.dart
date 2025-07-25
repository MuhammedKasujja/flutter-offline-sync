String formatApiBaseUrl(String url) {
  String baseUrl = url.trim();
  if (baseUrl.endsWith('/') == false) {
    return '$baseUrl/';
  }
  return baseUrl;
}

String formatApiEndpoint(String endpoint) {
  String uri = endpoint.trim();
  if (uri.startsWith('/')) {
    return uri.substring(1);
  }
  return uri;
}

String formattedBaseUrl({required String baseUrl, required String? endpoint}) {
  if (endpoint != null) {
    return '${formatApiBaseUrl(baseUrl)}${formatApiEndpoint(endpoint)}';
  }
  return formatApiBaseUrl(baseUrl);
}
