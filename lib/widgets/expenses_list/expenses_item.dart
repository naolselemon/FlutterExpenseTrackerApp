import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text("\$${expense.amount}"),
                const Spacer(), // space between
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    Text(expense.time.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
