import 'package:fin_app/core/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/goals_cubit.dart';
import '../cubit/goals_cubit_state.dart';
import '../screens/goal_info.dart';

class ItemGoal extends StatelessWidget {
  final String id;

  const ItemGoal({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      builder: (context, state) {
        if (state is! GoalsSuccessState) return const SizedBox();
        final percent = state.goals[id]!.currentSum / state.goals[id]!.goalSum;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoalInfoScreen(id: id),
              ),
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: targetColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        LinearProgressIndicator(
                          minHeight: 48,
                          value: percent,
                          color: targetColor,
                          backgroundColor: Colors.transparent,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Text(
                            state.goals[id]!.name,
                            style: context.textStyles.titleMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${(percent * 100).floor()}%',
                        style: context.textStyles.titleMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
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
