import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, leisure, food }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.time,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final String amount;
  final DateTime time;
  final Category category;
}
