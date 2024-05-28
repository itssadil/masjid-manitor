import 'package:flutter/material.dart';

class NamazTimeList extends StatelessWidget {
  NamazTimeList({
    required this.namazTime,
    required this.nextNamaz,
  });

  final List<Map<String, dynamic>> namazTime;
  final nextNamaz;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.5,
            child: DataTable(
              headingRowColor:
                  WidgetStateColor.resolveWith((states) => Colors.black54),
              headingTextStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              border: TableBorder.all(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              clipBehavior: Clip.antiAlias,
              columns: [
                DataColumn(
                  label: DataColumnText(
                    name: "namaz",
                    align: Alignment.centerLeft,
                  ),
                ),
                DataColumn(
                  label: DataColumnText(
                    name: "Adhan",
                    align: Alignment.center,
                  ),
                ),
                DataColumn(
                  label: DataColumnText(
                    name: "Iqamah",
                    align: Alignment.centerRight,
                  ),
                ),
              ],
              rows: namazTime.map((namazData) {
                return DataRow(
                  cells: [
                    DataCellText(
                      info: namazData['name'],
                      name: namazData['name'],
                      align: Alignment.centerLeft,
                      context: context,
                    ),
                    DataCellText(
                      info:
                          "${namazData['Athan hr']}:${namazData['Athan min']} ${namazData['isAm'] ? 'AM' : 'PM'}",
                      name: namazData['name'],
                      align: Alignment.center,
                      context: context,
                    ),
                    DataCellText(
                      info:
                          "${namazData['Iqama hr']}:${namazData['Iqama min']} ${namazData['isAm'] ? 'AM' : 'PM'}",
                      name: namazData['name'],
                      align: Alignment.centerRight,
                      context: context,
                    ), // Formatting Athan time
                    // Formatting Iqama time
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  DataColumnText({required String name, required align}) {
    return Expanded(
      child: Align(
        alignment: align,
        child: Text(name),
      ),
    );
  }

  DataCellText(
      {required String info,
      required String name,
      required align,
      required context}) {
    return DataCell(
      Align(
        alignment: align,
        child: Text(
          info,
          style: TextStyle(
            fontSize: 25,
            color: name == "$nextNamaz"
                ? Colors.blue
                : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
            fontWeight:
                name == "$nextNamaz" ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
