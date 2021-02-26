import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackedHabitsNotifier extends ChangeNotifier {
  // Set vars
  final String habitsList = "habits";
  List<Habit> _habits;
  SharedPreferences _pref;

  // Set getters
  List<Habit> get habits => _habits;

  // Set default constructor
  TrackedHabitsNotifier() {
    _habits = [];
    _loadFromPrefs();
  }

  // _initPref() is to iniliaze  the _pref variable
  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _habits = _pref.get(habitsList);
    notifyListeners();
  }

  _saveThemeToPrefs() async {
    await _initPrefs();
    _pref.setStringList(habitsList, _habits);
  }

  void updateTheme(List<Habit> habits) {
    this._habits = habits;
    _saveThemeToPrefs();
    notifyListeners();
  }
}
