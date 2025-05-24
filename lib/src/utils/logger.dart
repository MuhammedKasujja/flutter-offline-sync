import 'package:logger/logger.dart';

class _SystemLogger {
  final Logger _logger = Logger(printer: PrettyPrinter());
  void debug(dynamic message) => _logger.d(message);
  void info(dynamic message) => _logger.i(message);
  void warning(dynamic message) => _logger.w(message);
  void error(dynamic message, [dynamic error]) =>
      _logger.e(message, error: error, stackTrace: StackTrace.current);
}

final logger = _SystemLogger();
