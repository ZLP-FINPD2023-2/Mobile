import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/goals/presentation/cubit/goals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddGoal extends StatefulWidget {
  const AddGoal({super.key});

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController goalSumController;
  late TextEditingController currentSumController;
  final List<BudgetModel> budgets = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    goalSumController = TextEditingController();
    currentSumController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: goalColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Новая цель',
          style: context.textStyles.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  decoration: homeTheme.copyWith(
                    labelText: 'Бюджеты',
                    hintText: 'Выберите бюджеты',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 336,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: targetColor, // Задайте желаемый цвет фона кнопки
                ),
                onPressed: () {
                  context.read<GoalsCubit>().addGoal(
                        name: nameController.text,
                        description: descriptionController.text,
                        goalSum: int.tryParse(goalSumController.text) ?? 0,
                        currentSum:
                            int.tryParse(currentSumController.text) ?? 0,
                        budgets: budgets,
                      );
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
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    goalSumController.dispose();
    currentSumController.dispose();
  }
}
