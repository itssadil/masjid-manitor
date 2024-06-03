import 'package:flutter/material.dart';
import 'package:masjid_tv/screens/homeScreen/sections/timerScreen.dart';

import 'namazTimeVer.dart';

class NamazTime extends StatefulWidget {
  const NamazTime({Key? key}) : super(key: key);

  @override
  State<NamazTime> createState() => _NamazTimeState();
}

class _NamazTimeState extends State<NamazTime> {
  final List<Map<String, dynamic>> namazTime = [
    {
      "name": "Fajr",
      "Athan hr": 3,
      "Athan min": 25,
      "Iqama hr": 3,
      "Iqama min": 45,
      "isAm": true,
    },
    {
      "name": "Dhuhr",
      "Athan hr": 1,
      "Athan min": 10,
      "Iqama hr": 1,
      "Iqama min": 30,
      "isAm": false,
    },
    {
      "name": "Asr",
      "Athan hr": 4,
      "Athan min": 15,
      "Iqama hr": 4,
      "Iqama min": 30,
      "isAm": false,
    },
    {
      "name": "Magrib",
      "Athan hr": 6,
      "Athan min": 25,
      "Iqama hr": 6,
      "Iqama min": 40,
      "isAm": false,
    },
    {
      "name": "Isha",
      "Athan hr": 8,
      "Athan min": 15,
      "Iqama hr": 8,
      "Iqama min": 45,
      "isAm": false,
    },
    {
      "name": "Jumuʽah",
      "Athan hr": 12,
      "Athan min": 15,
      "Iqama hr": 12,
      "Iqama min": 45,
      "Iqama2 hr": 1,
      "Iqama2 min": 45,
      "isAm": false,
    },
    {
      "name": "Sunrise",
      "Athan hr": 3,
      "Athan min": 25,
      "Iqama hr": 3,
      "Iqama min": 45,
      "Iqama2 hr": 3,
      "Iqama2 min": 45,
      "isAm": true,
    },
    {
      "name": "Sunset",
      "Athan hr": 3,
      "Athan min": 25,
      "Iqama hr": 3,
      "Iqama min": 45,
      "Iqama2 hr": 3,
      "Iqama2 min": 45,
      "isAm": false,
    },
  ];

  int hours = 0;
  int minutes = 0;

  final Map<String, TimeOfDay> prayerTimes = {
    "Fajr": TimeOfDay(hour: 3, minute: 25),
    "Dhuhr": TimeOfDay(hour: 13, minute: 10),
    "Asr": TimeOfDay(hour: 16, minute: 15),
    "Magrib": TimeOfDay(hour: 18, minute: 25),
    "Isha": TimeOfDay(hour: 20, minute: 15),
    "Jumuʽah": TimeOfDay(
      hour: 12,
      minute: 15,
    ), // Assuming Jummah prayer has the same Dhuhr time
  };

  String nextNamaz = "";
  final TimeOfDay customTime = TimeOfDay.now(); // Custom time set to 13:55

  void _findNextNamaz() {
    final time = customTime; // Use the pre-defined customTime
    for (final namaz in prayerTimes.keys) {
      if (time.hour < prayerTimes[namaz]!.hour ||
          (time.hour == prayerTimes[namaz]!.hour &&
              time.minute < prayerTimes[namaz]!.minute)) {
        setState(() {
          nextNamaz = namaz;
        });
        return;
      }
    }
    // If loop completes, it's after all prayer times
    setState(() {
      nextNamaz = "Fajr";
    });
  }

  @override
  void initState() {
    super.initState();
    _findNextNamaz();
  }

  @override
  Widget build(BuildContext context) {
    for (var prayer in namazTime) {
      if (prayer["name"] == nextNamaz) {
        hours = prayer["Athan hr"];
        minutes = prayer["Athan min"];
        bool isAm = prayer["isAm"];

        if (!isAm && hours < 12) {
          hours += 12; // Convert PM times to 24-hour format
        } else if (isAm && hours == 12) {
          hours = 0; // Convert 12 AM to 00
        }
        break;
      }
    }
    return Column(
      children: [
        SizedBox(height: 10),
        TimerScreen(hour: hours, minute: minutes, namazName: nextNamaz),
        SizedBox(height: 10),
        NamazTimeList(namazTime: namazTime, nextNamaz: nextNamaz),
        // NamazTimeGrid(namazTime: namazTime, nextNamaz: nextNamaz),
      ],
    );
  }
}
