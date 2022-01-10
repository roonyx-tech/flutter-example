import 'package:e_shop_flutter/ui/main/logic/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_provider.dart';

const String themeKey = 'THEME_KEY';

class AppSettings extends DataProvider {
  AppSettings(SharedPreferences sharedPreferences) : super(sharedPreferences);

  Future<ThemeState> getTheme() async {
    final String value = await get(themeKey, ThemeState.dark.getValue());

    if (ThemeState.dark.getValue() == value) {
      return ThemeState.dark;
    } else if (ThemeState.light.getValue() == value) {
      return ThemeState.light;
    } else {
      throw 'This value is not of enum value';
    }
  }

  void setTheme(ThemeState theme) => save(themeKey, theme.getValue());

  @override
  Future<T> get<T>(String key, T defaultValue) {
    return super.get(key, defaultValue);
  }
}
