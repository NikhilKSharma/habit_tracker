import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/light_mode.dart';
import 'package:habit_tracker/theme/dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initial theme
  ThemeData _themeData = darkMode;

  //get current theme
  ThemeData get themeData => _themeData;

  //dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
