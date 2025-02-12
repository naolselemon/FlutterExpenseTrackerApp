import "package:expense_tracker/widgets/expenses_list/expenses_list.dart";
import "package:flutter/material.dart";

import "package:expense_tracker/models/expenses.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter course",
        amount: "20",
        time: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Grocereis",
        amount: "25",
        time: DateTime.now(),
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("Chart"),
        ExpensesList(expenses: _registeredExpenses)
      ],
    ));
  }
}
