import 'package:dio/dio.dart';
import '../../../app_state/app_state.dart';

typedef JSONObject = Map<String, dynamic>;
typedef JSONList = List<JSONObject>;

class NetworkHandler {
  static Future<AppStateSuccess<T>> parseResult<T, K>(
      Future<Response<dynamic>> req, Function(K data)? cb) {
    return req.then((Response<dynamic> resp) {
      switch (resp.statusCode) {
        case 200:
          Map<String, dynamic> rawData = resp.data;
          if (rawData.containsKey('data')) {
            if ((rawData['data'] != null && rawData['data'] != '') &&
                cb != null) {
              if (rawData['data'] is List) {
                final JSONList result = List.from(rawData['data']);
                return AppStateSuccess<T>(cb(result as K));
              } else {
                K data = rawData['data'] as K;
                return AppStateSuccess<T>(cb(data));
              }
            }
          }
          return AppStateSuccess<T>();
        case 204:
          return AppStateSuccess<T>();
        case 404:
          throw AppStateError('[404] страница не найдена',
              key: 'server.error', details: resp.realUri.path);
        case 400:
        case 422:
          Map<String, dynamic> rawData = resp.data;
          if (rawData.containsKey('errors')) {
            if (rawData['errors'] != null) {
              NetworkWBErrorModel result = NetworkWBErrorModel.fronJson(
                  resp.statusCode!, rawData['errors']);
              throw AppStateWarning(result.toString(),
                  key: result.getKey(), details: result.detail);
            }
          }
          throw AppStateError('[422] server error: no content',
              key: 'server.error');
        default:
          if (resp.data is String) {
            throw AppStateError('[${resp.statusCode}] server error',
                details: resp.data, key: 'server.error');
          }

          Map<String, dynamic> rawData = resp.data;
          if (rawData.containsKey('errors')) {
            if (rawData['errors'] != null) {
              NetworkWBErrorModel result = NetworkWBErrorModel.fronJson(
                  resp.statusCode!, rawData['errors']);
              throw AppStateError(result.toString(),
                  key: result.getKey(), details: result.detail);
            }
          }
          throw AppStateError('[${resp.statusCode}] server error',
              key: 'server.error');
      }
    });
  }
}

class NetworkHandlerWithoutData {
  static Future<AppStateSuccess<T>> parseResult<T, K>(
      Future<Response<dynamic>> req, Function(K data)? cb) {
    return req.then((Response<dynamic> resp) {
      switch (resp.statusCode) {
        case 200:
          if (resp.data != null && cb != null) {
            if (resp.data is List) {
              List<dynamic> rawData = resp.data;
              final JSONList result = List.from(rawData);
              return AppStateSuccess<T>(cb(result as K));
            } else {
              K data = resp.data as K;
              return AppStateSuccess<T>(cb(data));
            }
          }
          return AppStateSuccess<T>();
        case 204:
          return AppStateSuccess<T>();
        case 404:
          throw AppStateError('[404] страница не найдена',
              key: 'server.error', details: resp.realUri.path);
        case 400:
        case 422:
          Map<String, dynamic> rawData = resp.data;
          if (rawData.containsKey('errors')) {
            if (rawData['errors'] != null) {
              NetworkWBErrorModel result = NetworkWBErrorModel.fronJson(
                  resp.statusCode!, rawData['errors']);
              throw AppStateWarning(result.toString(),
                  key: result.getKey(), details: result.detail);
            }
          }
          throw AppStateError('[422] server error: no content',
              key: 'server.error');
        default:
          if (resp.data is String) {
            throw AppStateError('[${resp.statusCode}] server error',
                details: resp.data, key: 'server.error');
          }

          Map<String, dynamic> rawData = resp.data;
          if (rawData.containsKey('errors')) {
            if (rawData['errors'] != null) {
              NetworkWBErrorModel result = NetworkWBErrorModel.fronJson(
                  resp.statusCode!, rawData['errors']);
              throw AppStateError(result.toString(),
                  key: result.getKey(), details: result.detail);
            }
          }
          throw AppStateError('[${resp.statusCode}] server error',
              key: 'server.error');
      }
    });
  }
}

class NetworkWBErrorModel {
  final String? key;
  final String? message;
  final String? detail;
  final int? statusCode;
  final bool isFatal;

  NetworkWBErrorModel({
    required this.isFatal,
    this.key,
    this.message,
    this.statusCode,
    this.detail,
  });

  factory NetworkWBErrorModel.fronJson(
      int statusCode, List<dynamic> jsonErrors) {
    Map first = jsonErrors.first;
    return NetworkWBErrorModel(
        isFatal: statusCode >= 500,
        statusCode: statusCode,
        key: first['error'],
        message: first['message'],
        detail: first['detail']);
  }

  String getKey() {
    return key ?? '';
  }

  @override
  String toString() {
    String? msg = message ?? key;
    msg ??= 'NetworkWBErrorModel';
    return '[$statusCode] $msg';
  }
}
