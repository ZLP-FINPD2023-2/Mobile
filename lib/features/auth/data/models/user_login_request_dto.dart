import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request_dto.g.dart';

@JsonSerializable()
class UserLoginRequestDTO {
  final String email;
  final String password;

  const UserLoginRequestDTO({
    required this.email,
    required this.password,
  });

  Map<String, Object?> toJson() => _$UserLoginRequestDTOToJson(this);
}
