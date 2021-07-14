import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DataProvider {
  @protected
  Future<T> get<T>(String key, T defaultValue) async {
    var prefs = await SharedPreferences.getInstance();

    if (defaultValue is String) {
      return (prefs.getString(key)?? defaultValue) as T;
    } else if (defaultValue is int) {
      return (prefs.getInt(key) ?? defaultValue) as T ;
    } else if (defaultValue is bool) {
      return (prefs.getBool(key) ?? defaultValue) as T ;
    } else {
      throw 'This type:${defaultValue.runtimeType} doesn\'t supported';
    }
  }

  @protected
  Future<void> save<T>(String key, T value) async {
    var prefs = await SharedPreferences.getInstance();

    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else {
      throw 'This type:${value.runtimeType} doesn\'t supported';
    }
  }
}
