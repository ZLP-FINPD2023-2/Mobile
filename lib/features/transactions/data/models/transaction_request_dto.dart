import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class TransactionRequestDTO with _$TransactionRequestDTO {
  const factory TransactionRequestDTO({
    required String name,
    required String description,
    required int sum,
    required String date,
    @Default([]) List<BudgetModel> budgets,
  }) = _TransactionRequestDTO;

  factory TransactionRequestDTO.fromJson(Map<String, dynamic> json) => _$TransactionRequestDTO(json);
}
