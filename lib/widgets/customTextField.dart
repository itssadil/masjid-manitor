import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/passVisible.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.isSuffix,
    this.onChanged,
  }) : super(key: key);

  final controller;
  final obscureText;
  final labelText;
  final isSuffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          labelText: "$labelText",
          labelStyle: TextStyle(color: Colors.grey),
          suffixIcon: customSuffix(),
          suffixIconColor: Colors.grey,
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
        onChanged: onChanged,
      ),
    );
  }

  customSuffix() {
    if (isSuffix == true) {
      return Consumer<PassVisible>(
        builder: (context, isPassVisible, child) {
          return IconButton(
            onPressed: () => isPassVisible.toggle(!obscureText),
            icon: obscureText
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          );
        },
      );
    }
  }
}
