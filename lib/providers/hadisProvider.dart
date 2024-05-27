import 'package:flutter/material.dart';

class HadisProvider with ChangeNotifier {
  bool _isHadis = true;
  bool get isHadis => _isHadis;

  void toggle(bool isOn) {
    _isHadis = isOn;
    notifyListeners();
  }
}
