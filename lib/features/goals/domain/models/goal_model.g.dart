// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalModelImpl _$$GoalModelImplFromJson(Map<String, dynamic> json) =>
    _$GoalModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      goalSum: json['goalSum'] as int,
      currentSum: json['currentSum'] as int,
      budgets: (json['budgets'] as List<dynamic>)
          .map((e) => BudgetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GoalModelImplToJson(_$GoalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'goalSum': instance.goalSum,
      'currentSum': instance.currentSum,
      'budgets': instance.budgets,
    };
