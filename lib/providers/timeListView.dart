import 'package:flutter/material.dart';

class TimeListView with ChangeNotifier {
  int _isListView = 1;
  int get isListView => _isListView;

  void toggle(int value) {
    _isListView = value;
    notifyListeners();
  }
}
