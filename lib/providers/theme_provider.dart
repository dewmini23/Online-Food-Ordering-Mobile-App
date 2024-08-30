import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEME STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {  // method *** called here when the app restarts 
    getTheme();
  }
  setDarkTheme(bool value) async {  // To set the theme
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
    _darkTheme = value;
    notifyListeners(); // to listen to changes 
  }

  Future<bool> getTheme() async {
    // *** this method called directly when the app starts to run to show last saved theme
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
