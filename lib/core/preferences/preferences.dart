import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class Preferences {
  Preferences(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _user = 'user_profile';

  Future<UserLoginResponseEntity?> getUser() async {
    return UserLoginResponseEntity.fromJson(jsonDecode(_sharedPreferences.getString(_user) ?? ""));
  }

  Future<bool> setUser(UserLoginResponseEntity profile) async {
    return _sharedPreferences.setString(_user, jsonEncode(profile));
  }

  static const _languageKey = 'language';

  Future<String?> getLanguage() async {
    return _sharedPreferences.getString(_languageKey);
  }

  Future<bool> setLanguage(String language) async {
    return _sharedPreferences.setString(_languageKey, language);
  }
}
