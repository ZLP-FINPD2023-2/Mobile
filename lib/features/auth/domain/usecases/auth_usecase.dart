import 'package:fin_app/features/auth/data/datasources/server_auth_datasource.dart';
import 'package:fin_app/features/auth/data/models/user_login_request_dto.dart';
import 'package:fin_app/features/auth/data/models/user_registration_request_dto.dart';
import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final ServerAuthDataSource _serverAuthDataSource;
  final FlutterSecureStorage _secureStorage;

  const AuthUseCase({
    required ServerAuthDataSource serverAuthDataSource,
    required FlutterSecureStorage secureStorage,
  })  : _serverAuthDataSource = serverAuthDataSource,
        _secureStorage = secureStorage;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final userLoginDTO = UserLoginRequestDTO(
      email: email,
      password: password,
    );

    final token = await _serverAuthDataSource.signIn(
      userLoginDTO,
    );

    await _secureStorage.write(key: 'token', value: token);
  }

  Future<void> signUp({
    required String birthday,
    required String email,
    required String firstname,
    required Gender gender,
    required String lastname,
    required String password,
    required String patronymic,
  }) async {
    final formattedBirthday = birthday.replaceAll(".", "-");

    final userRegistrationDTO = UserRegistrationRequestDTO(
      birthday: formattedBirthday,
      email: email,
      firstname: firstname,
      gender: gender,
      lastname: lastname,
      password: password,
      patronymic: patronymic,
    );

    await _serverAuthDataSource.signUp(
      userRegistrationDTO,
    );
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
  }
}
