import "package:flutter/material.dart";

import "package:expense_tracker/models/expenses.dart";
import "package:expense_tracker/widgets/expenses_list/expenses_list.dart";
import "package:expense_tracker/widgets/new_expense.dart";

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
        amount: 20,
        time: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Groceries",
        amount: 30,
        time: DateTime.now(),
        category: Category.food)
  ];

  void _openAddNewExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 242, 242),
        appBar: AppBar(
          title: const Text("ExpensesTracker"),
          actions: [
            IconButton(
                onPressed: _openAddNewExpenseOverlay,
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            const Text("Chart"),
            ExpensesList(expenses: _registeredExpenses)
          ],
        ));
  }
}
