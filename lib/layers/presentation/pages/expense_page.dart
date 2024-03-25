import 'package:expenses/layers/domain/entities/expense_entity.dart';
import 'package:expenses/layers/presentation/widgets/expenses_list/expenses_list_widget.dart';
import 'package:expenses/layers/presentation/widgets/new_expense/new_expense_widget.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<ExpenseEntity> expensesMock = [
    ExpenseEntity(
      title: "Flutter Curse",
      amount: 19.99,
      date: DateTime.now(),
      category: CategoryEnum.work,
    ),
    ExpenseEntity(
      title: "Cinema",
      amount: 15.69,
      date: DateTime.now(),
      category: CategoryEnum.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Scaffold(
          body: NewExpenseWidget(onAddExpense: _addExpense),
        );
      },
    );
  }

  void _addExpense(ExpenseEntity expense) {
    setState(() {
      expensesMock.add(expense);
    });
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
