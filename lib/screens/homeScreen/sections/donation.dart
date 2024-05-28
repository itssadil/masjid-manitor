import 'package:flutter/material.dart';

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isQrCode = true;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomCard(
            info: "Please Donate",
            Color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 10),
        Image.asset(
          _isQrCode == true
              ? "assets/images/icon.png"
              : "assets/images/icon.png",
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        SizedBox(height: 10),
        CustomCard(
          info:
              "Account Name: Baitus Salam Jame Masjid \nAccount Number: 17253845234351467 \nSort Code: 07-17-27\nAccount Type: Business",
          Color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  CustomCard({required String info, required Color}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "$info",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      color: Color,
    );
  }
}
