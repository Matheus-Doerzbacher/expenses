import 'package:expenses/layers/domain/entities/expense_entity.dart';

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
