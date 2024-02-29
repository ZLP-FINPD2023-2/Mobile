import 'package:fin_app/features/budget/domain/models/budget_model.dart';
import 'package:fin_app/features/budget/presentation/cubit/budget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/features/budget/presentation/screens/budget_info.dart';
import 'package:fin_app/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBudget extends StatelessWidget {
  final BudgetModel budget;
  final int index;

  const ItemBudget({super.key, required this.budget, required this.index});

  void onBudgetTap(BuildContext context, int index, BudgetCubit budgetCubit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BudgetInfoScreen(index: index, budgetCubit: budgetCubit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final budgetCubit = BlocProvider.of<BudgetCubit>(context, listen: false);

    return GestureDetector(
      onTap: () => onBudgetTap(context, index, budgetCubit),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: const BoxDecoration(
                    color: walletColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  budget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Text(
              "${budget.sum}₽",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
