import 'package:e_shop_flutter/di/modules.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DataProvider {
  final SharedPreferences _prefs = getIt.get<SharedPreferences>();

  @protected
  Future<T> get<T>(String key, T defaultValue) async {
    if (defaultValue is String) {
      return (_prefs.getString(key) ?? defaultValue) as T;
    } else if (defaultValue is int) {
      return (_prefs.getInt(key) ?? defaultValue) as T;
    } else if (defaultValue is bool) {
      return (_prefs.getBool(key) ?? defaultValue) as T;
    } else {
      throw 'This type:${defaultValue.runtimeType} doesn\'t supported';
    }
  }

  @protected
  Future<void> save<T>(String key, T value) async {
    if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else {
      throw 'This type:${value.runtimeType} doesn\'t supported';
    }
  }
}
