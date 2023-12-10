import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:fin_app/features/home/presentation/budget/cubit/budget_cubit/budget_cubit.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/budget_info.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBudget extends StatelessWidget {
  final int index;
  final BudgetCubit budgetCubit;

  EditBudget({
    Key? key,
    required this.index,
    required this.budgetCubit,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController sumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: budgetColor,
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
                  controller: sumController,
                  decoration: homeTheme.copyWith(
                    labelText: 'Сумма',
                    hintText: 'Настройте сумму',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 336,
              child: ElevatedButton(
                onPressed: () {
                  final updatedBudget = BudgetInfo(
                    name: nameController.text,
                    description: descriptionController.text,
                    sum: int.parse(sumController.text),
                  );
                  budgetCubit.updateBudget(index, updatedBudget);
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
}
