import 'package:expenses/layers/presentation/widgets/expenses_list/expenses_list_widget.dart';
import 'package:expenses/mock_data.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const Scaffold(
          body: Column(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The chart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          // Toolbar with the Add button => ROW()
          Expanded(
            child: ExpensesListWidget(expenses: expensesMock),
          ),
        ],
      ),
    );
  }
}
