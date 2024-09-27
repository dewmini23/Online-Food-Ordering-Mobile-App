import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";
  bool _adminDarkTheme = false;
  bool get getIsDarkTheme => _adminDarkTheme;

  AdminThemeProvider() {
    getTheme();
  }
  setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, themeValue);
    _adminDarkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _adminDarkTheme = prefs.getBool(THEME_STATUS) ?? false;
    notifyListeners();
    return _adminDarkTheme;
  }
}
