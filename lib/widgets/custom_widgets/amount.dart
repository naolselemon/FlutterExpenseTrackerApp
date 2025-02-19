import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  const Amount({super.key, required this.amount});
  final TextEditingController amount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: amount,
        keyboardType: TextInputType.number,
        decoration:
            const InputDecoration(label: Text("Amount"), prefixText: "Q"),
      ),
    );
  }
}
