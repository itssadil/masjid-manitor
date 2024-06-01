import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/darkModeProvider.dart';
import 'package:masjid_tv/providers/donationProvider.dart';
import 'package:masjid_tv/providers/fridayHadisProvider.dart';
import 'package:masjid_tv/providers/hadisProvider.dart';
import 'package:masjid_tv/providers/hadisTimer.dart';
import 'package:masjid_tv/providers/passVisible.dart';
import 'package:masjid_tv/providers/stepperProvider.dart';
import 'package:masjid_tv/providers/timeListView.dart';
import 'package:masjid_tv/providers/toDoProvider.dart';
import 'package:masjid_tv/screens/splashScreen.dart';
import 'package:masjid_tv/services/googleSignInProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCXk8NyDt41vhHTtvkJY2u2CKcLDvrd9oE",
      appId: "1:113600725431:web:2cc8b73d8e88c3de8e6832",
      messagingSenderId: "113600725431",
      projectId: "masjid-monitor",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DarkModeProvider()..initialize()),
        ChangeNotifierProvider(create: (context) => ToDoProvider()),
        ChangeNotifierProvider(create: (context) => HadisProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => PassVisible()),
        ChangeNotifierProvider(create: (context) => HadisTimer()),
        ChangeNotifierProvider(create: (context) => FridayHadisProvider()),
        ChangeNotifierProvider(create: (context) => DonationProvider()),
        ChangeNotifierProvider(create: (context) => TimeListView()),
        ChangeNotifierProvider(create: (context) => StepperProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Masjid TV",
      themeMode: darkModeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const SplashScreen(),
    );
  }
}
