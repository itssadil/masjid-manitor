import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  String _textValue = "";
  String _streetValue = "";
  String _unitValue = "";
  String _cityValue = "";
  String _countryValue = "";
  String _zipValue = "";
  String get textValue => _textValue;

  void changeValue(String value, int index) {
    switch (index) {
      case 0:
        _streetValue = value;
        break;
      case 1:
        _unitValue = value;
        break;
        break;
      case 3:
        _cityValue = value;
        break;
      case 4:
        _countryValue = value;
        break;
      default:
        _zipValue = value;
    }
    _textValue =
        "$_unitValue $_streetValue $_cityValue $_countryValue $_zipValue";
    notifyListeners();
  }
}
