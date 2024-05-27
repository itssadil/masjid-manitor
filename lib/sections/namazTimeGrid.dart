import 'package:flutter/material.dart';

class NamazTimeGrid extends StatelessWidget {
  NamazTimeGrid({
    required this.namazTime,
    required this.nextNamaz,
  });

  final List<Map<String, dynamic>> namazTime;
  final nextNamaz;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 10,
      children: namazTime.map(
        (namazData) {
          return Card(
            margin: EdgeInsets.only(bottom: 10),
            color: namazData["name"] == nextNamaz
                ? Colors.green
                : Colors.tealAccent,
            child: Column(
              children: [
                Container(
                  width: width * 0.15,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: namazData["name"] == nextNamaz
                        ? Colors.tealAccent
                        : Colors.grey,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "${namazData["name"]}",
                    textAlign: TextAlign.center,
                    style: CustomStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomColumn(
                        name: "Adhan",
                        info:
                            "${namazData["Athan hr"]} : ${namazData["Athan min"]}",
                      ),
                      SizedBox(width: 50),
                      CustomColumn(
                        name: "Iqamah",
                        info:
                            "${namazData["Iqama hr"]} : ${namazData["Iqama min"]}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  CustomColumn({required String name, required String info}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            name,
            style: CustomStyle(fontSize: 17),
          ),
          SizedBox(height: 10),
          Text(
            info,
            style: CustomStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  CustomStyle({required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
