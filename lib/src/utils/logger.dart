import 'package:logger/logger.dart';

enum LogLevel {
  db,
  dev;

  bool get isDev => this == LogLevel.dev;
  bool get isDB => this == LogLevel.db;
}

class _SystemLogger {
  final Logger _logger = Logger(printer: PrettyPrinter());
  void debug(dynamic message, {LogLevel level = LogLevel.dev}) =>
      _logger.d(message);
  void info(dynamic message, {LogLevel level = LogLevel.dev}) =>
      _logger.i(message);
  void warning(dynamic message, {LogLevel level = LogLevel.dev}) =>
      _logger.w(message);
  void error(dynamic message, [dynamic error]) =>
      _logger.e(message, error: error, stackTrace: StackTrace.current);
}

final logger = _SystemLogger();
