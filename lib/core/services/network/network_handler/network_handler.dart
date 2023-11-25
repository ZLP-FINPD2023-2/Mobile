import 'package:dio/dio.dart';
import '../../../app_state/app_state.dart';

typedef JSONObject = Map<String, dynamic>;
typedef JSONList = List<JSONObject>;

class NetworkHandler {
  static AppStateSuccess<Map<String, dynamic>> parseResult(Response<dynamic> resp) {
    switch (resp.statusCode) {
      case 200:
        Map<String, dynamic> rawData = resp.data;

        if (rawData.containsKey('data')) {
          return AppStateSuccess<Map<String, dynamic>>(rawData['data']);
        } else if (rawData.containsKey('token')) {
          return AppStateSuccess<Map<String, dynamic>>(rawData);
        }
        return AppStateSuccess<Map<String, dynamic>>(rawData);
      case 204:
        return AppStateSuccess<Map<String, dynamic>>();
      case 404:
        throw AppStateError('[404] страница не найдена', key: 'server.error', details: resp.realUri.path);
      case 400:
      case 422:
        Map<String, dynamic> rawData = resp.data;

        if (rawData.containsKey('errors')) {
          if (rawData['errors'] != null) {
            throw AppStateWarning('${resp.statusCode} ${resp.statusMessage}');
          }
        }

        throw AppStateError('[422] server error: no content', key: 'server.error');
      default:
        if (resp.data is String) {
          throw AppStateError('[${resp.statusCode}] server error', details: resp.data, key: 'server.error');
        }

        throw AppStateError('[${resp.statusCode}] server error', key: 'server.error');
    }
  }
}
