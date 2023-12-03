import 'package:fin_app/features/home/presentation/budget/budget_screen.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/features/home/presentation/budget/widgets/budget_info.dart';
import 'package:fin_app/constants/colors.dart';

class ItemBudget extends StatelessWidget {
  final BudgetInfo budget;

  const ItemBudget({
    required this.budget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Здесь вы можете использовать budget для навигации или других действий
      },
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
            )
          ],
        ),
      ),
    );
  }
}
