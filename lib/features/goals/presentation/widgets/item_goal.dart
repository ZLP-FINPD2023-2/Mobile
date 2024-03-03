import 'package:fin_app/constants/colors.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:fin_app/features/goals/presentation/widgets/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/goals_cubit.dart';
import '../cubit/goals_state.dart';
import '../screens/goal_info.dart';

class ItemGoal extends StatelessWidget {
  final GoalModel goal;

  const ItemGoal({
    required this.goal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final percent = goal.currentSum / goal.goalSum;
    return BlocBuilder<GoalsCubit, GoalsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GoalInfoScreen(goalId: goal.id),
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xff475569)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        goal.name,
                        style: context.textStyles.titleMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${(percent * 100).floor()}%',
                        style: context.textStyles.titleMedium?.copyWith(
                          color: textDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearPercentIndicator(
                    lineHeight: 12,
                    percent: percent,
                    progressColor: targetColor,
                    barRadius: const Radius.circular(6),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
