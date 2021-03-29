import 'package:flutter/material.dart';

class KeyboardNotifier extends ChangeNotifier {
  bool _showKeyboard = false;
  get showKeyboard => _showKeyboard;

  void updateKeyboard(bool keyboard) {
    this._showKeyboard = keyboard;
    notifyListeners();
  }
}
