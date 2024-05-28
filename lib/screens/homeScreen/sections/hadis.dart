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
        ),
        CustomCard(
          isArabic: true,
          hadis:
              "عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ قَالَ قَالَ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ لَا صَلَاةَ بَعْدَ الصُّبْحِ حَتَّى تَرْتَفِعَ الشَّمْسُ وَلَا صَلَاةَ بَعْدَ الْعَصْرِ حَتَّى تَغِيبَ الشَّمْسُ",
        ),
        CustomCard(
          isArabic: false,
          hadis:
              "আবূ সায়ীদ খুদ্‌রী (রাঃ) থেকে বর্ণিত, তিনি বলেন, আমি রাসূলুল্লাহ সাল্লাল্লাহু আলাইহি ওয়াসাল্লাম-কে বলতে শুনেছি যে, ফজরের পর সূর্য উদিত হয়ে (একটু) উপরে না উঠা পর্যন্ত এবং আসরের পর সূর্য অস্তমিত না হওয়া পর্যন্ত কোন সালাত (নামায/নামাজ) নেই।",
        ),
      ],
    );
  }

  CustomCard({required String hadis, required bool isArabic}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          hadis,
          style: TextStyle(
            // fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          textAlign: isArabic ? TextAlign.end : TextAlign.start,
        ),
      ),
    );
  }
}
