import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masjid_tv/widgets/clock/angle.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final second = DateTime.now().second.toDouble();
    return Angle(
      height: height * 0.2,
      width: 3,
      offsetY: 35,
      clr: Colors.black54,
      angle: (-pi * (second / -60) * 2),
    );
  }
}
