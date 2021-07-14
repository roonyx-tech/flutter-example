import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/di/modules.dart';
import '../../res/assets/assets_provider.dart';
import '../../res/themes/base_themes.dart';
import 'package:flutter/material.dart';
import '../../data/app_settings.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

enum ThemeState { dark, light }

extension ThemeStateExt on ThemeState {
  String getValue() {
    switch (this) {
      case ThemeState.dark:
        return 'DARK';
      case ThemeState.light:
        return 'LIGHT';
    }
  }

  ThemeData getTheme() {
    switch (this) {
      case ThemeState.dark:
        return darkTheme;
      case ThemeState.light:
        return lightTheme;
    }
  }

  String getAssert() {
    switch (this) {
      case ThemeState.dark:
        return icSun;
      case ThemeState.light:
        return icMoon;
    }
  }

  Color getIcColor() {
    switch (this) {
      case ThemeState.dark:
        return Colors.white;
      case ThemeState.light:
        return Colors.black;
    }
  }

  Color getBackgroundColor() {
    switch (this) {
      case ThemeState.dark:
        return darkTheme.scaffoldBackgroundColor;
      case ThemeState.light:
        return lightTheme.scaffoldBackgroundColor;
    }
  }
}

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  final AppSettings _settings = getIt.get<AppSettings>();

  ThemeState _theme = ThemeState.dark;
  String get themeIc => _theme.getAssert();
  ThemeData get themeData => _theme.getTheme();
  Color get themeIcColor => _theme.getIcColor();
  Color get backgrpundColor => _theme.getBackgroundColor();

  void init() async {
    _theme = await _settings.getTheme();
    emit(PurchasesThemeChanged(_theme));
  }

  void changeThemeMode() {
    _theme = _theme == ThemeState.dark ? ThemeState.light : ThemeState.dark;
    _settings.setTheme(_theme);
    emit(PurchasesThemeChanged(_theme));
  }
}
