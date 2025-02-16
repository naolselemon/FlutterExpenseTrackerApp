import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

DateFormat formatter = DateFormat.yMd();

enum Category { education, food, cleaningMaterial, transportation }

const categoryIcons = {
  Category.education: Icons.school,
  Category.food: Icons.lunch_dining,
  Category.cleaningMaterial: Icons.clean_hands_outlined,
  Category.transportation: Icons.directions_bus
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.time,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime time;
  final Category category;

  String get formatDate {
    return formatter.format(time);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where(
                (expense) => // where method return true for false for list of expenses
                    expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double totalExpense = 0;

    for (var expense in expenses) {
      totalExpense += expense.amount;
    }

    return totalExpense;
  }
}
