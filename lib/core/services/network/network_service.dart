import 'package:dio/dio.dart';
import 'package:fin_app/core/flutter_core.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkService {
  final Dio _dio;

  NetworkService() : _dio = HttpAPI.newDio();


  Future<AppStateSuccess<Map<String, dynamic>>> delete(String endpoint) {
    return NetworkHandler.parseResult(_dio.delete(endpoint));
  }

  Future<AppStateSuccess<Map<String, dynamic>>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult(
        _dio.get(endpoint, queryParameters: queryParameters));
  }

  Future<AppStateSuccess<Map<String, dynamic>>> post(String endpoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) {
    return NetworkHandler.parseResult(
        _dio.post(endpoint, queryParameters: queryParameters, data: data));
  }


  Future<AppStateSuccess<Map<String, dynamic>>> put(String endpoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) {
    return NetworkHandler.parseResult(
        _dio.put(endpoint, queryParameters: queryParameters, data: data));
  }

}
