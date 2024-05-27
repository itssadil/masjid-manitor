import 'package:flutter/material.dart';

class FridayHadisProvider with ChangeNotifier {
  bool _isFridayHadis = true;
  bool get isFridayHadis => _isFridayHadis;

  void toggle(bool isOn) {
    _isFridayHadis = isOn;
    notifyListeners();
  }
}
