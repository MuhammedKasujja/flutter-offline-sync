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

// String formatDate(DateTime date) {
//   final formatter = DateFormat('MM DD YYYY, HH:mm a');
//   return formatter.format(date);
// }

String formatDate(DateTime date) {
  String monthName = _monthNames[date.month - 1];
  String amPm = date.hour >= 12 ? "PM" : "AM";
  int hour12 = date.hour % 12 == 0 ? 12 : date.hour % 12;
  return "${date.day} $monthName ${date.year}, $hour12:${date.minute.toString().padLeft(2, '0')} $amPm";
}

const List<String> _monthNames = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];
