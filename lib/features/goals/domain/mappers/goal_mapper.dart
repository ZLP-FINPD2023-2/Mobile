import 'package:fin_app/features/goals/data/models/goal_request_dto.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:uuid/uuid.dart';

class GoalMapper {
  static GoalModel fromDTO(GoalRequestDTO goalDto) {
    return GoalModel(
      id: const Uuid().v4(),
      name: goalDto.name,
      description: goalDto.description,
      goalSum: goalDto.goalSum,
      currentSum: goalDto.currentSum,
    );
  }
}
