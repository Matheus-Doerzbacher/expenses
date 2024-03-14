import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class ExpenseEntity {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Category category;

  ExpenseEntity({
    required this.title,
    required this.price,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
