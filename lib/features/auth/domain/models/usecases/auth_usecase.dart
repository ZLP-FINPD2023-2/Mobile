import 'package:fin_app/features/auth/data/datasources/server_auth_datasource.dart';
import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final ServerAuthDataSource _serverAuthDataSource;
  final FlutterSecureStorage _secureStorage;

  const AuthUseCase(
      {required ServerAuthDataSource serverAuthDataSource,
      required FlutterSecureStorage secureStorage})
      : _serverAuthDataSource = serverAuthDataSource,
        _secureStorage = secureStorage;

  Future<User> signIn({required String email, required String password}) async {
    final (user, token) =
        await _serverAuthDataSource.signIn(email: email, password: password);

    await _secureStorage.write(key: 'token', value: token);

    return user;
  }

  Future<void> signUp({
    required int age,
    required String email,
    required String firstname,
    required bool gender,
    required String lastname,
    required String password,
    required String patronymic,
  }) async {
    await _serverAuthDataSource.signUp(
      age: age,
      email: email,
      firstname: firstname,
      gender: gender,
      lastname: lastname,
      password: password,
      patronymic: patronymic,
    );
  }
}
