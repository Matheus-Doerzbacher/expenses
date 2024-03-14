import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseEntity {
  final String id;
  final String title;
  final double price;
  final DateTime date;

  ExpenseEntity({
    required this.title,
    required this.price,
    required this.date,
  }) : id = uuid.v4();
}
