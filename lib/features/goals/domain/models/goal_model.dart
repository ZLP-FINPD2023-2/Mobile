import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/presentation/domain/models/budget_model.dart';


part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
class GoalModel with _$GoalModel {
  const factory GoalModel({
    required String id,
    required String name,
    required String description,
    required int goalSum,
    required int currentSum,
    required List<BudgetModel> budgets,
  }) = _GoalModel;

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);
}
