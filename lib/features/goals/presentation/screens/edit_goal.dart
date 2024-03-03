import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/goals/domain/models/goal_model.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_state.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditGoal extends StatefulWidget {
  final GoalModel goal;

  const EditGoal({
    super.key,
    required this.goal,
  });

  @override
  State<EditGoal> createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController goalSumController;
  late TextEditingController currentSumController;
  List<BudgetModel> budgets = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.goal.name);
    descriptionController = TextEditingController(text: widget.goal.description);
    goalSumController = TextEditingController(text: widget.goal.goalSum.toString());
    currentSumController = TextEditingController(text: widget.goal.currentSum.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: targetColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Редактирование',
          style: context.textStyles.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<GoalsCubit, GoalsState>(
              bloc: context.read<GoalsCubit>(),
              builder: (context, state) {
                // final currentState = state as GoalsSuccessState;
                // nameController.text = currentState.goals[widget.id]?.name ?? '';
                // descriptionController.text =
                //     currentState.goals[widget.id]?.description ?? '';
                // goalSumController.text =
                //     currentState.goals[widget.id]?.goalSum.toString() ?? '';
                // currentSumController.text =
                //     currentState.goals[widget.id]?.currentSum.toString() ?? '';
                // budgets = currentState.goals[widget.id]?.budgets ?? [];
                return Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: homeTheme.copyWith(
                        labelText: 'Название',
                        hintText: 'Введите название',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      decoration: homeTheme.copyWith(
                        labelText: 'Описание',
                        hintText: 'Добавьте описание',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: goalSumController,
                      keyboardType: TextInputType.number,
                      decoration: homeTheme.copyWith(
                        labelText: 'Сумма',
                        hintText: 'Настройте сумму',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: currentSumController,
                      keyboardType: TextInputType.number,
                      decoration: homeTheme.copyWith(
                        labelText: 'Накоплено',
                        hintText: 'Введите, сколько вы уже накопили',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      enabled: false,
                      decoration: homeTheme.copyWith(
                        labelText: 'Бюджеты',
                        hintText: 'Выберите бюджеты',
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 50,
              width: 336,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: targetColor, // Задайте желаемый цвет фона кнопки
                ),
                onPressed: () {
                  final editedGoal = GoalModel(
                    id: widget.goal.id,
                    name: nameController.text,
                    description: descriptionController.text,
                    currentSum: int.tryParse(currentSumController.text) ?? 0,
                    goalSum: int.tryParse(goalSumController.text) ?? 0,
                    budgets: budgets,
                  );

                  context.read<GoalsCubit>().editGoal(editedGoal: editedGoal);

                  Navigator.pop(context);
                },
                child: const Text('Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    goalSumController.dispose();
    currentSumController.dispose();
    super.dispose();
  }
}
