import 'package:e_shop_flutter/res/Colors/base_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor));

ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor));
