import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum CategoryEnum { food, travel, leisure, work }

const categoryIcons = {
  CategoryEnum.food: Icons.lunch_dining,
  CategoryEnum.travel: Icons.flight_takeoff,
  CategoryEnum.leisure: Icons.movie,
  CategoryEnum.work: Icons.work
};

class ExpenseEntity {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryEnum category;

  ExpenseEntity({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucketEntity {
  final CategoryEnum category;
  final List<ExpenseEntity> expenses;

  ExpenseBucketEntity({
    required this.category,
    required this.expenses,
  });

  ExpenseBucketEntity.forCategory(
      List<ExpenseEntity> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
