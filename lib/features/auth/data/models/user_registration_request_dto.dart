import 'package:fin_app/features/auth/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_request_dto.g.dart';

@JsonSerializable()
class UserRegistrationRequestDTO {
  final String email;
  final String password;
  final String firstname;
  final Gender gender;
  final String lastname;
  final String patronymic;
  final String birthday;

  const UserRegistrationRequestDTO({
    required this.birthday,
    required this.email,
    required this.firstname,
    required this.gender,
    required this.lastname,
    required this.password,
    required this.patronymic,
  });

  Map<String, Object?> toJson() => _$UserRegistrationRequestDTOToJson(this);
}
