import 'package:flutter/material.dart';

Widget Angle({
  required double height,
  required double width,
  required double angle,
  required double offsetY,
  required Color clr,
}) {
  return RotatedBox(
    quarterTurns: 2,
    child: Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0, offsetY),
        child: Container(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: clr,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          alignment: Alignment(0, 0),
        ),
      ),
    ),
  );
}
