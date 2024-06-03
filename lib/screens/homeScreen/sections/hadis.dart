import 'package:flutter/material.dart';

class Hadis extends StatelessWidget {
  const Hadis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          isArabic: false,
          hadis:
              "Abu Sa’id al-Khudri reported: The Messenger of Allah, peace and blessings be upon him, said, “There is no prayer after the morning prayer until the sun has risen, and there is no prayer after the afternoon prayer until the sun has set.”",
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.tealAccent
              : null,
          fontSize: 25,
          alignment: Alignment.center,
        ),
        CustomCard(
          isArabic: true,
          hadis:
              "عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ قَالَ قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ لَا صَلَاةَ بَعْدَ الصُّبْحِ حَتَّى تَرْتَفِعَ الشَّمْسُ وَلَا صَلَاةَ بَعْدَ الْعَصْرِ حَتَّى تَغِيبَ الشَّمْسُ",
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.tealAccent
              : null,
          fontSize: 25,
          alignment: Alignment.center,
        ),
        CustomCard(
          isArabic: true,
          hadis: "Source: Ṣaḥīḥ al-Bukhārī 552, Ṣaḥīḥ Muslim 626",
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.green
              : null,
          fontSize: 20,
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }

  CustomCard({
    required String hadis,
    required bool isArabic,
    Color? color,
    required double fontSize,
    required AlignmentGeometry alignment,
  }) {
    return Align(
      alignment: alignment,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: color,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            hadis,
            style: TextStyle(
              // fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
            textAlign: isArabic ? TextAlign.end : TextAlign.start,
          ),
        ),
      ),
    );
  }
}
