import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/screens/add_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/goals_state.dart';
import 'widgets/item_goal.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GoalsCubit>().getGoals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Цели', style: context.textStyles.headlineMedium),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: context.colors.shadow,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AddGoal(),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text(error)),
              success: (goals) => ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ItemGoal(goal: goals[index]),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
