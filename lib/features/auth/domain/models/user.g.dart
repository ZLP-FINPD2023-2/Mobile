// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      age: json['age'] as int,
      email: json['email'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      patronymic: json['patronymic'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'age': instance.age,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'patronymic': instance.patronymic,
    };

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
};
