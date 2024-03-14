import 'package:expenses/layers/domain/entitties/expense_entity.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  final List<ExpenseEntity> expenses;

  const ExpensesListWidget({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
