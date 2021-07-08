import 'package:bloc/bloc.dart';
import '../../base/assets_provider.dart';
import '../../base/base_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'purchases_state.dart';

enum ThemeState { dark, light }

extension ThemeStateExt on ThemeState {
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

  ThemeState _theme = ThemeState.dark;
  String get themeIc => _theme.getAssert();
  ThemeData get themeData => _theme.getTheme();
  Color get themeIcColor => _theme.getIcColor();

  void addPurchase() {
    
  }

  void changeThemeMode() {
    _theme = _theme == ThemeState.dark ? ThemeState.light : ThemeState.dark;
    emit(PurchasesThemeChanged(_theme));
  }
}
