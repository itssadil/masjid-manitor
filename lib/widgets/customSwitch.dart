import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch(
      {Key? key,
      required this.value,
      required this.title,
      required this.onChangeValue})
      : super(key: key);
  late final bool value;
  final String title;
  final Function(bool) onChangeValue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (value) => onChangeValue(value),
    );
  }
}
