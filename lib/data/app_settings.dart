import '../ui/main/main_cubit.dart';

import 'data_provider.dart';

const String themeKey = 'THEME_KEY';

class AppSettings extends DataProvider {
  static final AppSettings _instance = AppSettings._internal();

  factory AppSettings.getInstance() {
    return _instance;
  }

  AppSettings._internal() {
    // some initial
  }

  Future<ThemeState> getTheme() async {
    String value = await get(themeKey, ThemeState.dark.getValue());

    if (ThemeState.dark.getValue() == value) {
      return ThemeState.dark;
    } else if (ThemeState.light.getValue() == value) {
      return ThemeState.light;
    } else {
      throw 'This value is not of enum value';
    }
  }

  void setTheme(ThemeState theme) async =>
      await save(themeKey, theme.getValue());

  @override
  Future<T> get<T>(String key, T defaultValue) {
    return super.get(key, defaultValue);
  }
}
