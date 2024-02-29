import 'package:fin_app/features/budget/presentation/cubit/budget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/constants/colors.dart';

class DeleteBudget extends StatelessWidget {
  final int index;
  final BudgetCubit budgetCubit;

  const DeleteBudget({
    super.key,
    required this.index,
    required this.budgetCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Удаление',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Вы точно хотите удалить бюджет?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff44464F),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      budgetCubit.deleteBudget(index);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Да',
                      style: TextStyle(fontSize: 14, color: Color(0xff1b438f)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Нет',
                      style: TextStyle(fontSize: 14, color: errorColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
