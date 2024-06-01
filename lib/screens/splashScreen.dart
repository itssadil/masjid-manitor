import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masjid_tv/screens/loginScreen/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (_) => navigateToHome(_));
  }

  void navigateToHome(Timer timer) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }),
    );
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/icon.png"), height: 150),
            SizedBox(height: 10),
            Text(
              "Masjid Monitor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
