import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  // Set vars
  final String theme = "theme";
  bool _isDarkMode;
  SharedPreferences _pref;

  // Set getters
  bool get isDarkMode => _isDarkMode;

  // Set default constructor
  ThemeNotifier() {
    _isDarkMode = true;
    _loadFromPrefs();
  }

  // _initPref() is to iniliaze  the _pref variable
  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDarkMode = _pref.getBool(theme) ?? true;
    notifyListeners();
  }

  _saveThemeToPrefs() async {
    await _initPrefs();
    _pref.setBool(theme, _isDarkMode);
  }

  void updateTheme(bool _isDarkMode) {
    this._isDarkMode = _isDarkMode;
    _saveThemeToPrefs();
    notifyListeners();
  }
}
