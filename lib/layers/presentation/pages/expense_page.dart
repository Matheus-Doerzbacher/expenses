import 'package:expenses/layers/presentation/widgets/expenses_list/expenses_list_widget.dart';
import 'package:expenses/mock_data.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesListWidget(expenses: expensesMock),
          ),
        ],
      ),
    );
  }
}
