import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri/jHijri.dart';
import 'package:masjid_tv/widgets/clock/clock.dart';

class ClockSection extends StatelessWidget {
  const ClockSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hijri = JHijri.now();
    final DateTime now = DateTime.now();
    final currentDate = DateFormat('yMMMEd').format(now);

    final monthNames = {
      1: "Muharram",
      2: "Safar",
      3: "Rabiʽ al-Awwal",
      4: "Rabiʽ ath-Thani",
      5: "Jumada al-Awwal",
      6: "Jumada ath-Thaniyah",
      7: "Rajab",
      8: "Shaʽban",
      9: "Ramadan",
      10: "Shawwal",
      11: "Dhu al-Qaʽdah",
      12: "Dhu al-Hijjah",
    };

    String englishMonthName = monthNames[hijri.month] ?? 'Unknown';
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? "assets/images/bismillah.jpg"
                  : "assets/images/dark mode bismillah.png",
              width: 210,
            ),
            SizedBox(height: 10),
            Clock(),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.grey,
                ),
                children: <TextSpan>[
                  TextSpan(text: "${hijri.day} "),
                  TextSpan(text: "$englishMonthName (${hijri.monthName}) "),
                  TextSpan(text: "${hijri.year}"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "$currentDate",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade500,
              ),
            ),
          ],
        );
      },
    );
  }
}
