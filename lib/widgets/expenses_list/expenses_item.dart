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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text("Q${expense.amount.toStringAsFixed(2)}"),
                const Spacer(), // space between
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    Text(expense.formatDate)
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
