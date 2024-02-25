// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequestDTO _$UserLoginRequestDTOFromJson(Map<String, dynamic> json) =>
    UserLoginRequestDTO(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginRequestDTOToJson(
        UserLoginRequestDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
