import 'package:flutter/material.dart';

class HadisTimer with ChangeNotifier {
  int _hadisValue = 30;
  int get hadisValue => _hadisValue;

  void toggle(int value) {
    _hadisValue = value;
    notifyListeners();
  }
}
