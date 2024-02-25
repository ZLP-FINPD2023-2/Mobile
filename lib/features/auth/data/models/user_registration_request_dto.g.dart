// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistrationRequestDTO _$UserRegistrationRequestDTOFromJson(
        Map<String, dynamic> json) =>
    UserRegistrationRequestDTO(
      birthday: json['birthday'] as String,
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      lastname: json['lastname'] as String,
      password: json['password'] as String,
      patronymic: json['patronymic'] as String,
    );

Map<String, dynamic> _$UserRegistrationRequestDTOToJson(
        UserRegistrationRequestDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstname': instance.firstname,
      'gender': _$GenderEnumMap[instance.gender]!,
      'lastname': instance.lastname,
      'patronymic': instance.patronymic,
      'birthday': instance.birthday,
    };

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
};
