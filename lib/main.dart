import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorTheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 89, 59, 181));
var kDarkTheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 12, 61, 53));
void main() {
  runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkTheme,
          cardTheme: const CardTheme().copyWith(
              color: kDarkTheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkTheme.primaryContainer))),
      theme: ThemeData().copyWith(
          colorScheme: kColorTheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorTheme.onPrimaryContainer,
              foregroundColor: kColorTheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: kColorTheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorTheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kColorTheme.onPrimaryContainer))),
      debugShowCheckedModeBanner: false,
      home: const Expenses()));
}
