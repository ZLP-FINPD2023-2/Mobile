import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_request_dto.freezed.dart';
part 'goal_request_dto.g.dart';

@freezed
class GoalRequestDTO with _$GoalRequestDTO {
  const factory GoalRequestDTO({
    required String name,
    required String description,
    required int goalSum,
    required int currentSum,
    @Default([]) List<BudgetModel> budgets,
  }) = _GoalRequestDTO;

  factory GoalRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$GoalRequestDTOFromJson(json);
}
