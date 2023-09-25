library app_state;

import 'package:dio/dio.dart';

class AppState {
  static AppStateWrong catchErrorHandler(Object? error, {String? details}) {
    if (error == null) {
      return AppStateError('unidentified error', details: details);
    }
    if (error is AppStateWrong) {
      return error;
    } else if (error is DioException) {
      return AppStateError(error.message ?? '', details: details);
    } else if (error is TypeError) {
      /* Logger.appLog(AppLog(
        logType: Level.error,
        message: error.toString(),
        error: error.stackTrace.toString(),
      )); */
      return AppStateError(error.toString(), details: details);
    }

    /* Logger.appLog(AppLog(
      logType: Level.error,
      message: 'unhandled error',
      error: error.toString(),
    )); */
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
