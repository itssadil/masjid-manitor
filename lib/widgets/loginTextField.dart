import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.labelText})
      : super(key: key);

  final controller;
  final obscureText;
  final labelText;
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
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
