import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.g.dart';
part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    required TransactionType type,
    required String name,
    required String description,
    required int sum,
    required String date,
    @Default([]) List<BudgetModel> budgets,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}

enum TransactionType { income, expenditure }
