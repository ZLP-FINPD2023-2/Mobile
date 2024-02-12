// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      name: json['name'] as String,
      description: json['description'] as String,
      sum: json['sum'] as int,
      date: json['date'] as String,
      budgets: (json['budgets'] as List<dynamic>?)
              ?.map((e) => BudgetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'name': instance.name,
      'description': instance.description,
      'sum': instance.sum,
      'date': instance.date,
      'budgets': instance.budgets,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expenditure: 'expenditure',
};
