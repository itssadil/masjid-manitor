import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/passVisible.dart';
import 'package:provider/provider.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.isSuffix,
  }) : super(key: key);

  final controller;
  final obscureText;
  final labelText;
  final isSuffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          labelText: "$labelText",
          suffixIcon: customSuffix(),
          suffixIconColor: Colors.grey,
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
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
