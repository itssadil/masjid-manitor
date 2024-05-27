import 'package:flutter/material.dart';
import 'package:masjid_tv/widgets/clock/digitalClock.dart';
import 'package:masjid_tv/widgets/clock/dot.dart';
import 'package:masjid_tv/widgets/clock/hour.dart';
import 'package:masjid_tv/widgets/clock/minute.dart';
import 'package:masjid_tv/widgets/clock/second.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(20),
      height: height * 0.5,
      width: height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/clock3.png"),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0.5),
            child: DigitalClock(),
          ),
          Minute(),
          Hour(),
          Second(),
          Dot(),
        ],
      ),
    );
  }
}
