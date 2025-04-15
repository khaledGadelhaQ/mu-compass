import 'package:flutter/material.dart';

ThemeData apptheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)))),
);
