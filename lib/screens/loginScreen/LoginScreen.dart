import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/screens/homeScreen/homeScreen.dart';
import 'package:masjid_tv/screens/loginScreen/loginUi/loginUi.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else if (snapshot.hasError) {
            return Text("Something went wrong!");
          } else {
            return Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: LogInUi(
                      alignment: Alignment.center,
                      isLoginPage: true,
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  textStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade700,
    );
  }
}
