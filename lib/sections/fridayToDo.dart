import 'package:flutter/material.dart';

class FridayToDoList extends StatelessWidget {
  const FridayToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        Theme.of(context).brightness == Brightness.light
            ? "assets/images/FridayToDo.jpg"
            : "assets/images/darkFridayToDo.png",
        width: size.height * 0.8,
      ),
    );
  }
}
