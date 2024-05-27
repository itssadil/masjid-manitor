import 'package:flutter/material.dart';

class ToDoProvider with ChangeNotifier {
  bool _isToDo = true;
  bool get isToDo => _isToDo;

  void toggle(bool isOn) {
    _isToDo = isOn;
    notifyListeners();
  }
}
