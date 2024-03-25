import 'package:expenses/layers/domain/entities/expense_entity.dart';
import 'package:expenses/layers/presentation/widgets/expenses_list/expense_item_widget.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  final List<ExpenseEntity> expenses;
  final void Function(ExpenseEntity expense) onRemoveExpense;

  const ExpensesListWidget(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItemWidget(
          expense: expenses[index],
        ),
      ),
    );
  }
}
