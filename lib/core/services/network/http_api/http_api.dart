import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpAPI {
  static late final String _baseURLHost;
  static late final Future<String?> Function() _getAuthTokenFn;

  static void initialize({
    required String defaultBaseURL,
    required Future<String?> Function() getAuthTokenFn,
  }) {
    _baseURLHost = defaultBaseURL;
    _getAuthTokenFn = getAuthTokenFn;
  }

  static String getWmsBaseURLHost() {
    return _baseURLHost;
  }

  static Dio newDio({
    int receiveTimeout = 5000,
    int connectTimeout = 5000,
    bool allowBadCertificate = false,
  }) {
    final options = BaseOptions(baseUrl: _baseURLHost);
    options.receiveTimeout = Duration(milliseconds: receiveTimeout);
    options.connectTimeout = Duration(milliseconds: connectTimeout);
    options.sendTimeout = Duration(milliseconds: receiveTimeout);
    final dio = Dio(options);
    if (allowBadCertificate == true) {
      (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
          (X509Certificate? cert, String host, int port) {
        return true;
      };
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        //Интерсептор подстановки авторизации
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final token = await _getAuthTokenFn();
          options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
