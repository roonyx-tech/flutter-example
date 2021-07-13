import 'package:e_shop_flutter/base/base_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: ACCENT_COLOR));

ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: ACCENT_COLOR));
