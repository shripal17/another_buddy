import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  bool getBool(String key, bool defaultValue) =>
      _prefs.getBool(key) ?? defaultValue;

  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  String getString(String key, String defaultValue) =>
      _prefs.getString(key) ?? defaultValue;

  Future<void> setDouble(String key, double value) => _prefs.setDouble(key, value);

  double getDouble(String key, double defaultValue) =>
      _prefs.getDouble(key) ?? defaultValue;

  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  int getInt(String key, int defaultValue) =>
      _prefs.getInt(key) ?? defaultValue;
}
