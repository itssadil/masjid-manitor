import 'package:flutter/material.dart';

class DonationProvider with ChangeNotifier {
  bool _isDonation = true;
  bool get isDonation => _isDonation;

  void toggle(bool isOn) {
    _isDonation = isOn;
    notifyListeners();
  }
}
