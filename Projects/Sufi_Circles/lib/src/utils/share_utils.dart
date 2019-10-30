import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Sufi_Circles/src/constants/keys.dart';

class ShareUtils {
  Future<void> setUserTokenDetails(IdTokenResult user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SET_USER_TOKEN, user.token);
    prefs.setString(SET_TOKEN_EXPIRY, user.expirationTime.toString());
  }

  Future<bool> setBoolPreference(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> getBoolPreference(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> setStringPreference(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<String> getStringPreference(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
