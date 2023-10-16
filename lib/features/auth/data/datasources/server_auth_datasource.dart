import 'package:fin_app/core/flutter_core.dart';
import 'package:fin_app/core/services/network/network_service.dart';
import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class ServerAuthDataSource {
  final NetworkService _networkService;

  const ServerAuthDataSource({required NetworkService networkService})
      : _networkService = networkService;

  Future<(User, String)> signIn(
      {required String email, required String password}) async {
    final Map<String, dynamic> queryParameters = {
      "email": email,
      "password": password,
    };

    final result = await _networkService.post(
      '/auth/login',
      queryParameters: queryParameters,
    );

    final data = result.data;

    if (data != null) {
      if (data.containsKey('token') && data.containsKey('user')) {
        final String token = data['token'] as String;
        final User user = User.fromJson(data['user'] as Map<String, dynamic>);
        return (user, token);
      }
      throw AppStateWarning(
          "[Sign in] Bad response:${data.containsKey('token') ? '' : ' no token'}${data.containsKey('user') ? '' : ' no user'}");
    }
    throw AppStateWarning("[Sign in] Bad response: No data field!");
  }

  Future<bool> signUp({
    required int age,
    required String email,
    required String firstname,
    required bool gender,
    required String lastname,
    required String password,
    required String patronymic,
  }) async {
    final Map<String, dynamic> queryParameters = {
      "age": age,
      "email": email,
      "firstname": firstname,
      "gender": gender,
      "lastname": lastname,
      "password": password,
      "patronymic": patronymic,
    };

    final result = await _networkService.post(
      '/auth/register',
      queryParameters: queryParameters,
    );

    final data = result.data;

    if (data != null) {
      // TODO: check some field
    }
    throw AppStateWarning("[Sign in] Bad response: No data field!");
  }
}
