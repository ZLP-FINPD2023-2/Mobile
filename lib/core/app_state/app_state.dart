import 'package:dio/dio.dart';

import '../logger/logger.dart';

class AppState {
  static AppStateWrong catchErrorHandler(Object? error, {String? details}) {
    if (error == null) {
      return AppStateError('unidentified error', details: details);
    }
    if (error is AppStateWrong) {
      return error;
    } else if (error is DioException) {
      return AppStateError(
        (error.response?.data as Map<String, dynamic>)
                .entries
                .firstOrNull
                ?.value ??
            error.message ??
            '',
        details: details,
      );
    } else if (error is TypeError) {
      logger.error(
        message: error.toString(),
        error: error,
        stackTrace: error.stackTrace,
      );
      return AppStateError(error.toString(), details: details);
    }

    logger.error(message: 'unhandled error', error: error);

    return AppStateError(error.toString(), details: details);
  }
}

class AppStateSuccess<T> extends AppState {
  T? data;

  AppStateSuccess([this.data]);

  bool isEmpty() {
    return data == null;
  }
}

class AppStateWrong extends AppState {
  final String message;
  final String? key;
  final String? details;

  AppStateWrong(this.message, {this.key, this.details});

  @override
  String toString() {
    return key != null ? '[$key] $message' : message;
  }
}

class AppStateError extends AppStateWrong {
  AppStateError(String message, {String? key, String? details})
      : super(message, key: key, details: details);
}

class AppStateWarning extends AppStateWrong {
  AppStateWarning(String message, {String? key, String? details})
      : super(message, key: key, details: details);
}

class AppStateDefault extends AppState {}

class AppStateLoading extends AppState {}
