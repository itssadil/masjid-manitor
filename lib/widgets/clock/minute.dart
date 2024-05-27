import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masjid_tv/widgets/clock/angle.dart';

class Minute extends StatelessWidget {
  const Minute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final minutes = DateTime.now().minute.toDouble();
    return Angle(
      height: height * 0.18,
      width: 7,
      offsetY: 33,
      clr: Colors.blue,
      angle: (-pi * (minutes / -60) * 2),
    );
  }
}
