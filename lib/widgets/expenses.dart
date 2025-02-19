import "package:expense_tracker/widgets/charts/charts.dart";
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
        title: "Lunch",
        amount: 100,
        time: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Dinner",
        amount: 35,
        time: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Soap",
        amount: 150,
        time: DateTime.now(),
        category: Category.cleaningMaterial),
    Expense(
        title: "Transport",
        amount: 50,
        time: DateTime.now(),
        category: Category.transportation)
  ];

  void _openAddNewExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        constraints: const BoxConstraints.expand(),
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: addNewExpense,
            ));
  }

  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    var expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    // snackbar to notify the user about the deletion
    //ScaffoldMessenger.of(context).showSnackBar() -- used to display the snackbar object
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    Widget mainContent = const Center(
        child: Text("No expenses available. Please add some expense! "));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ExpenseTracker"),
        actions: [
          IconButton(
              onPressed: _openAddNewExpenseOverlay,
              icon: const Icon(Icons.add)),
        ],
      ),
      body: width >= 600
          ? Row(
              children: [
                Expanded(child: Charts(expenses: _registeredExpenses)),
                Expanded(child: mainContent)
              ],
            )
          : Column(
              children: [
                Charts(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
