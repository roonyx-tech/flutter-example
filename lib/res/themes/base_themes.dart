import 'package:e_shop_flutter/res/colors/base_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.white60,
    dividerTheme: const DividerThemeData(
      color: Colors.white60,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: CustomColors.accentColor),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dividerTheme: const DividerThemeData(color: Colors.black26, space: 16),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: CustomColors.accentColor),
  );
}
