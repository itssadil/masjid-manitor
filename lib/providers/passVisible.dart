import 'package:flutter/material.dart';

class PassVisible with ChangeNotifier {
  bool _isPassVisible = true;
  bool get isPassVisible => _isPassVisible;

  void toggle(bool value) {
    _isPassVisible = value;
    notifyListeners();
  }
}
