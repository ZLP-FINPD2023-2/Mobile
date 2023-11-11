import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app_state/app_state.dart';
import 'http_api/http_api.dart';
import 'network_handler/network_handler.dart';

@injectable
class NetworkService {
  final Dio _dio;

  NetworkService() : _dio = HttpAPI.newDio();

  Future<AppStateSuccess<Map<String, dynamic>>> delete(String endpoint) async {
    final result = await _dio.delete(endpoint);

    return NetworkHandler.parseResult(result);
  }

  Future<AppStateSuccess<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final result = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    return NetworkHandler.parseResult(result);
  }

  Future<AppStateSuccess<Map<String, dynamic>>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final result = await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    return NetworkHandler.parseResult(result);
  }

  Future<AppStateSuccess<Map<String, dynamic>>> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final result = await _dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    return NetworkHandler.parseResult(result);
  }
}
