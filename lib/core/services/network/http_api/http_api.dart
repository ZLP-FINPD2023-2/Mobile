library http_api;

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class HttpAPI {
  static late final String _baseURLHost;
  static late final Future<String?> Function()? _getAuthTokenFn;
  static late final void Function()? _logoutFn;

  static void initialize({
    required String defaultBaseURL,
    Future<String?> Function()? getAuthTokenFn,
    void Function()? logoutFn,
  }) {
    _baseURLHost = defaultBaseURL;
    _getAuthTokenFn = getAuthTokenFn;
    _logoutFn = logoutFn;

    if (kDebugMode) {
      if (getAuthTokenFn == null) {
        print('!!! getAuthTokenFuture is empty !!!\r\n\r\n');
      }
      if (logoutFn == null) {
        print('!!! logoutFn is empty !!!\r\n\r\n');
      }
    }
  }

  static String getWmsBaseURLHost() {
    return _baseURLHost;
  }

  static Dio newDio({
    int receiveTimeout = 5000,
    int connectTimeout = 5000,
    bool ignoreErrCodes = true,
    bool logoutOn401 = true,
    bool forceJsonContent =
        false, // true - если в ответе нет хедера application/json
    bool allowBadCertificate = false,
    bool disableTokenVerification =
        false, // не проверять валидность и срок действия токена (логои, авторизация)
    String? baseURL,
  }) {
    final options = BaseOptions(
      baseUrl: baseURL ?? _baseURLHost,
    );
    if (ignoreErrCodes) {
      options.validateStatus = (status) {
        return status != null;
      };
    }
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
          if (options.baseUrl != _baseURLHost) {
            options = options.copyWith(baseUrl: _baseURLHost);
          }

          if (_getAuthTokenFn == null) {
            handler.next(options);
            return;
          }

          final token = await _getAuthTokenFn!();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          if (disableTokenVerification) {
            handler.next(options);
            return;
          }

          if (_logoutFn != null) {
            _logoutFn!();
          }
        },
        onResponse: (response, handler) {
          //Logger.eResponse(response);
          if (response.statusCode == 401 && logoutOn401) {
            if (_logoutFn != null) {
              _logoutFn!();
            }
            return handler.next(response);
          }

          if (response.statusCode == 204 ||
              (response.data.runtimeType == String && response.data == '')) {
            response.data = {'data': null};
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response == null) {
            return handler.reject(e);
          }

          // Logger.eResponse(e.response!);

          if (e.response != null && e.response!.statusCode == 401) {
            if (_logoutFn != null) {
              _logoutFn!();
            }
          }
          return handler.reject(e);
        },
      ),
    );

    if (forceJsonContent) {
      dio.interceptors.add(
        //Чтобы парсилось в json даже если бэком не установлен хэдер application/json
        InterceptorsWrapper(
          onResponse: (response, handler) {
            if (response.data.runtimeType == String) {
              response.data = jsonDecode(response.data);
            }
            handler.next(response);
          },
        ),
      );
    }

    if (!kReleaseMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
