import 'package:expenses/layers/domain/entitties/expense_entity.dart';

List<ExpenseEntity> expensesMock = [
  ExpenseEntity(
    title: "Flutter Curse",
    amount: 19.99,
    date: DateTime.now(),
    category: Category.work,
  ),
  ExpenseEntity(
    title: "Cinema",
    amount: 15.69,
    date: DateTime.now(),
    category: Category.leisure,
  ),
];