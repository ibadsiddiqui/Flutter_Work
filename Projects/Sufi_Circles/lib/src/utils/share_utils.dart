import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ShareUtils {
  SharedPreferences prefs;

  ShareUtils() {
    getInstance();
  }

  void getInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setBoolPreference(key, value) async {
    return prefs.setBool(key, value);
  }

  Future<bool> getBoolPreference(key) async {
    return prefs.getBool(key);
  }

  Future<bool> setStringPreference(key, value) async {
    return prefs.setString(key, value);
  }

  Future<String> getStringPreference(key) async {
    return prefs.getString(key);
  }
}
