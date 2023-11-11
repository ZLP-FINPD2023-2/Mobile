import 'package:logger/logger.dart';

final CustomLogger logger = CustomLogger();

class CustomLogger {
  final Logger logger;

  CustomLogger() : logger = Logger();

  void debug(String message) {
    logger.d(message);
  }

  void info(String message) {
    logger.i(message);
  }

  void warning(String message) {
    logger.w(message);
  }

  void error({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }
}
