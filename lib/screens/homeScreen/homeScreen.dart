import 'package:flutter/material.dart';
import 'package:masjid_tv/screens/homeScreen/sections/clockSection.dart';
import 'package:masjid_tv/screens/homeScreen/sections/hadis.dart';
import 'package:masjid_tv/widgets/myDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String masjidName = "Baitus Salam Jame Masjid";
    String masjidIcon = "assets/images/icon.png";
    return Scaffold(
      appBar: AppBar(
        title: Text("Masjid TV"),
        actions: [
          Image(
            image: AssetImage("$masjidIcon"),
            width: 30,
            height: 30,
          ),
          SizedBox(width: 10),
          Text(
            "$masjidName",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: ClockSection()),
            // Expanded(flex: 3, child: NamazTime()),
            // Expanded(flex: 3, child: Donation()),
            // Expanded(flex: 3, child: FridayToDoList()),
            Expanded(flex: 3, child: Hadis()),
          ],
        ),
      ),
    );
  }
}
