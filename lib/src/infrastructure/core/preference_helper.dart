import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:reader/src/domain/core/preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PreferenceContracts)
class PreferenceHelper implements PreferenceContracts {
  @override
  Future<bool> getBool({required String key}) async {
    final value = await _getData(key);
    return value.toLowerCase() == "true";
  }

  @override
  Future<double> getDouble({required String key}) async {
    final value = await _getData(key);
    return double.parse(value);
  }

  @override
  Future<int> getInt({required String key}) async {
    final value = await _getData(key);
    return int.parse(value);
  }

  @override
  Future<String> getString({required String key}) async {
    return await _getData(key);
  }

  @override
  void setBool({required String key, required bool value}) {
    _setData(key, value.toString());
  }

  @override
  void setDouble({required String key, required double value}) {
    _setData(key, value.toString());
  }

  @override
  void setInt({required String key, required int value}) {
    _setData(key, value.toString());
  }

  @override
  void setString({required String key, required String value}) {
    _setData(key, value);
  }

  Future<bool> _setData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<String> _getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  @override
  Future<List<String>> getStringList({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var listString = prefs.getString(key) ?? '';
    return listString.split(',').map((string) => string.trim()).toList();
  }

  @override
  void setStringList({required String key, required List<String> value}) async {
    var val = value.join(', ');
    _setData(key, val);
  }

  @override
  Future<List<T>> getListObject<T>({required String key, required Function fromJsonModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var listString = prefs.getString(key) ?? '';
    return fromJsonModel(jsonDecode(listString));
  }

  @override
  Future<T> getObject<T>({required String key, required Function fromJsonModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var listString = prefs.getString(key);
    return listString == null ? null : fromJsonModel(jsonDecode(listString));
  }

  @override
  void setListObject<T>({required String key, required List<T> value, required Function toJson}) async {
    _setData(key, jsonEncode(toJson));
  }

  @override
  Future<void> setObject<T>({required String key, required T value}) async {
    _setData(key, jsonEncode(value));
  }
}
