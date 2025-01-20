import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
  );
}
