import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/core/data/app_settings.dart';
import 'package:e_shop_flutter/res/themes/base_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../res/assets/assets_provider.dart';

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
        return CustomTheme.darkTheme;
      case ThemeState.light:
        return CustomTheme.lightTheme;
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
        return CustomTheme.darkTheme.scaffoldBackgroundColor;
      case ThemeState.light:
        return CustomTheme.lightTheme.scaffoldBackgroundColor;
    }
  }
}

class MainCubit extends Cubit<MainState> {
  final AppSettings _appSettings;

  MainCubit(AppSettings appSettings)
      : _appSettings = appSettings,
        super(MainInitial()) {
    init();
  }

  ThemeState _theme = ThemeState.dark;
  String get themeIc => _theme.getAssert();
  ThemeData get themeData => _theme.getTheme();
  Color get themeIcColor => _theme.getIcColor();
  Color get backgrpundColor => _theme.getBackgroundColor();

  void init() => _appSettings.getTheme().then(
        (theme) {
          _theme = theme;
          emit(PurchasesThemeChanged(_theme));
        },
      );

  void changeThemeMode() {
    _theme = _theme == ThemeState.dark ? ThemeState.light : ThemeState.dark;
    _appSettings.setTheme(_theme);
    emit(PurchasesThemeChanged(_theme));
  }
}
