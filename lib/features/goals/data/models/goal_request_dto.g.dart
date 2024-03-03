// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalRequestDTOImpl _$$GoalRequestDTOImplFromJson(Map<String, dynamic> json) =>
    _$GoalRequestDTOImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      goalSum: json['goalSum'] as int,
      currentSum: json['currentSum'] as int,
      budgets: (json['budgets'] as List<dynamic>?)
              ?.map((e) => BudgetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GoalRequestDTOImplToJson(
        _$GoalRequestDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'goalSum': instance.goalSum,
      'currentSum': instance.currentSum,
      'budgets': instance.budgets,
    };
