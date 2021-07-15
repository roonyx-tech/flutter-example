import 'package:e_shop_flutter/res/Colors/base_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.white60,
    dividerTheme: DividerThemeData(
      color: Colors.white60,
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor));

ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dividerTheme: DividerThemeData(color: Colors.black26, space: 16),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor));
