import 'package:fin_app/core/services/network/network_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app_state/app_state.dart';

@injectable
class ServerAuthDataSource {
  final NetworkService _networkService;

  const ServerAuthDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  Future<String> signIn(
      {required String email, required String password}) async {
    final Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };

    final response = await _networkService.post(
      '/auth/login',
      data: data,
    );

    final result = response.data;

    if (result != null && result.containsKey('token')) {
      return result['token'] as String;
    }
    throw AppStateWarning("[Sign in] Bad response: No token field!");
  }

  Future<void> signUp({
    required String age,
    required String email,
    required String firstname,
    required String gender,
    required String lastname,
    required String password,
    required String patronymic,
  }) async {
    final Map<String, dynamic> data = {
      "age": age,
      "email": email,
      "firstname": firstname,
      "gender": gender,
      "lastname": lastname,
      "password": password,
      "patronymic": patronymic,
    };

    final response = await _networkService.post(
      '/auth/register',
      data: data,
    );

    final result = response.data;

    if (result == null) {
      throw AppStateWarning("[Sign up] Bad response: No data field!");
    }
  }
}
