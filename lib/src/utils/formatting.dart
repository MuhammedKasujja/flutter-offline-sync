import 'dart:math';

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
  DateTime localDate = date.toLocal();
  String monthName = _monthNames[localDate.month - 1];
  String amPm = localDate.hour >= 12 ? "PM" : "AM";
  int hour12 = localDate.hour % 12 == 0 ? 12 : localDate.hour % 12;
  return "${localDate.day} $monthName ${localDate.year}, $hour12:${localDate.minute.toString().padLeft(2, '0')} $amPm";
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

double round(double? value, int precision) {
  if (value == null || value.isNaN) {
    return 0;
  }

  final int fac = pow(10, precision) as int;
  double result = value * fac;

  // Workaround for floating point issues:
  // ie. 35 * 1.107 => 38.745
  // ie. .75 * 55.3 => 41.4749999999
  if ('$result'.contains('999999')) {
    result += 0.000001;
  }

  return result.round() / fac;
}

String formatSize(int size) {
  return size > 1000000
      ? '${round(size / 1000000, 1).toInt()} MB'
      : '${round(size / 1000, 0).toInt()} KB';
}

String formatError(dynamic error) {
  if (error == null || (error is String && error.isEmpty)) {
    return 'Unknown error occured';
  }
  if (error is Exception || (error is String && error.contains('Exception'))) {
    return error.toString().replaceFirst('Exception: ', '');
  }
  return error.toString();
}
