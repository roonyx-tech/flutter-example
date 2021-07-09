import 'package:bloc/bloc.dart';
import '../../data/app_settings.dart';
import '../../base/assets_provider.dart';
import '../../base/base_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'purchases_state.dart';

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
        return IC_SUN;
      case ThemeState.light:
        return IC_MOON;
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
}

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit() : super(PurchasesInitial());

  AppSettings _settings = AppSettings.getInstance();

  ThemeState _theme = ThemeState.dark;
  String get themeIc => _theme.getAssert();
  ThemeData get themeData => _theme.getTheme();
  Color get themeIcColor => _theme.getIcColor();

  void init() async {
    _theme = await _settings.getTheme();
    emit(PurchasesThemeChanged(_theme));
  }

  void addPurchase() {}

  void changeThemeMode() {
    _theme = _theme == ThemeState.dark ? ThemeState.light : ThemeState.dark;
    _settings.setTheme(_theme);
    emit(PurchasesThemeChanged(_theme));
  }
}
