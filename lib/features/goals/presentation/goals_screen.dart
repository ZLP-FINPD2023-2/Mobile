import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/widgets/add_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/goal_model.dart';
import 'cubit/goals_cubit_state.dart';
import 'widgets/item_goal.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddGoal(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<GoalsCubit, GoalsState>(
          builder: (context, state) {
            if (state is GoalsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            final goals = state is GoalsSuccessState
                ? state.goals
                : <String, GoalModel>{};
            return ListView.builder(
              itemCount: goals.entries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ItemGoal(id: goals.entries.toList()[index].key),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
