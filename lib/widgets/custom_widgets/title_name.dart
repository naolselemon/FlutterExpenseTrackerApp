import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  const TitleName({super.key, required this.title});

  final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 50,
      decoration: const InputDecoration(label: Text("Title")),
      controller: title,
    );
  }
}
