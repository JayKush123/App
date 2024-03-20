import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setString(var key, var value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String> getString(var key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key) ?? '';
  }

  Future<void> setBoolean(var key, var value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  Future<bool> getBoolean(var key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key) ?? false;
  }
}
