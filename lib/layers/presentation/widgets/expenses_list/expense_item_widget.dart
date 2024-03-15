import 'package:expenses/layers/domain/entitties/expense_entity.dart';
import 'package:flutter/material.dart';

class ExpenseItemWidget extends StatelessWidget {
  final ExpenseEntity expense;
  const ExpenseItemWidget({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.card_travel),
                    const SizedBox(height: 8),
                    Text(expense.date.toString())
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
