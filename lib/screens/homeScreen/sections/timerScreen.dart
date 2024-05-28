import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  final int hour;
  final int minute;
  final String namazName;

  TimerScreen(
      {required this.hour, required this.minute, required this.namazName});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  DateTime? targetTime;
  Duration remainingTime = Duration();
  Timer? countdownTimer;

  void startTimer() {
    final now = DateTime.now();
    targetTime =
        DateTime(now.year, now.month, now.day, widget.hour, widget.minute);
    if (targetTime!.isBefore(now)) {
      targetTime = targetTime!.add(Duration(days: 1));
    }
    if (targetTime!.isAfter(now)) {
      remainingTime = targetTime!.difference(now);
      countdownTimer?.cancel();
      countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          remainingTime = remainingTime - Duration(seconds: 1);
          if (remainingTime.isNegative) {
            timer.cancel();
            remainingTime = Duration();
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                  text: '${widget.namazName} ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Adhan in:',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${remainingTime.inHours.toString().padLeft(2, '0')}h ${(remainingTime.inMinutes % 60).toString().padLeft(2, '0')}min ${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 60, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
