import '../ui/purchases/purchases_cubit.dart';

import 'data_provider.dart';

const String THEME_KEY = 'THEME_KEY';

class AppSettings extends DataProvider {
  static final AppSettings _instance = AppSettings._internal();

  factory AppSettings.getInstance() {
    return _instance;
  }

  AppSettings._internal() {
    // some initial
  }

  Future<ThemeState> getTheme() async {
    String value = await get(THEME_KEY, ThemeState.dark.getValue());

    if (ThemeState.dark.getValue() == value) {
      return ThemeState.dark;
    } else if (ThemeState.light.getValue() == value) {
      return ThemeState.light;
    } else
      throw 'This value is not of enum value';
  }

  void setTheme(ThemeState theme) async =>
      await save(THEME_KEY, theme.getValue());

  @override
  Future<T> get<T>(String key, T defaultValue) {
    return super.get(key, defaultValue);
  }
}
