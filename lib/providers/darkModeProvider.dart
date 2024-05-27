import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggle(bool isOn) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setBool("theme", isOn);

    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    bool myPrefs = _prefs.getBool("theme") ?? false;

    themeMode = myPrefs ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade800,
      secondary: Colors.black,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.greenAccent,
    ),
  );
}
