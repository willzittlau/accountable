import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HabitNotifier extends ChangeNotifier {
  void update() {
    notifyListeners();
  }
}
