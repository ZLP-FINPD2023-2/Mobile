import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/theme.dart';
import 'package:fin_app/core/extensions/context.dart';
import 'package:fin_app/constants/colors.dart';

class EditBudget extends StatefulWidget {
  final int index;

  const EditBudget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<EditBudget> createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {
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
                style: ElevatedButton.styleFrom(
                  primary: const Color(
                    0xff1b438f,
                  ), // Задайте желаемый цвет фона кнопки
                ),
                onPressed: () {
                  listOfBudgets[widget.index] =
                      listOfBudgets[widget.index].copyWith(
                    name: nameController.text,
                    description: descriptionController.text,
                    sum: int.parse(sumController.text),
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
}
