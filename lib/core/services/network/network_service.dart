import 'package:dio/dio.dart';
import 'package:fin_app/core/flutter_core.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkService {
  final Dio _dio;

  NetworkService() : _dio = HttpAPI.newDio();

  Future<AppStateSuccess<T>> delete<T, K>(
      String endpoint, Function(K data)? mapFunction) {
    return NetworkHandler.parseResult<T, K>(_dio.delete(endpoint), mapFunction);
  }

  Future<AppStateSuccess<T>> get<T, K>(
      String endpoint, Function(K data)? mapFunction,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult<T, K>(
        _dio.get(endpoint, queryParameters: queryParameters), mapFunction);
  }

  Future<AppStateSuccess<T>> post<T, K>(
      String endpoint, Function(K data)? mapFunction,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult<T, K>(
        _dio.post(endpoint, queryParameters: queryParameters), mapFunction);
  }

  Future<AppStateSuccess<T>> put<T, K>(
      String endpoint, Function(K data)? mapFunction,
      {Map<String, dynamic>? queryParameters}) {
    return NetworkHandler.parseResult<T, K>(
        _dio.put(endpoint, queryParameters: queryParameters), mapFunction);
  }
}
