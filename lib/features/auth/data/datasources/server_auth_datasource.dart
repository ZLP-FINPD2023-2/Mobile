import 'package:fin_app/core/services/network/network_service.dart';
import 'package:fin_app/features/auth/data/models/user_login_request_dto.dart';
import 'package:fin_app/features/auth/data/models/user_registration_request_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app_state/app_state.dart';
import 'auth_datasource_constants.dart';

@injectable
class ServerAuthDataSource {
  final NetworkService _networkService;

  const ServerAuthDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  Future<String> signIn(UserLoginRequestDTO userDTO) async {
    final response = await _networkService.post(
      AuthDatasourceConstants.loginPath,
      data: userDTO.toJson(),
    );

    final result = response.data;

    if (result != null &&
        result.containsKey(AuthDatasourceConstants.tokenKey)) {
      return result[AuthDatasourceConstants.tokenKey] as String;
    }
    throw AppStateWarning("[Sign in] Bad response: No token field!");
  }

  Future<void> signUp(UserRegistrationRequestDTO userDTO) async {
    final response = await _networkService.post(
      AuthDatasourceConstants.registrationPath,
      data: userDTO.toJson(),
    );

    final result = response.data;

    if (result == null) {
      throw AppStateWarning("[Sign up] Bad response: No data field!");
    }
  }
}
