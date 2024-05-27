import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masjid_tv/widgets/clock/angle.dart';

class Hour extends StatelessWidget {
  const Hour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour.toDouble();
    double height = MediaQuery.of(context).size.height;
    return Angle(
      height: height * 0.14,
      width: 7,
      offsetY: 20,
      angle: (-pi * (hour / -12) * 2),
      clr: Colors.orange,
    );
  }
}
