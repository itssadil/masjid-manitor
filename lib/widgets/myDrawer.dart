import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/darkModeProvider.dart';
import 'package:masjid_tv/providers/donationProvider.dart';
import 'package:masjid_tv/providers/fridayHadisProvider.dart';
import 'package:masjid_tv/providers/hadisProvider.dart';
import 'package:masjid_tv/providers/hadisTimer.dart';
import 'package:masjid_tv/providers/timeListView.dart';
import 'package:masjid_tv/providers/toDoProvider.dart';
import 'package:masjid_tv/widgets/customSwitch.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List _hadisItems = [
    20,
    30,
    40,
    50,
    60,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.4,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Baitus Salam Jame Masjid",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "34 Westbourne Road, Dowenend, Bristol BS16 6RX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture:
                Image(image: AssetImage("assets/images/icon.png")),
          ),
          DrawerDataTitle(title: "Theme"),
          Consumer<DarkModeProvider>(
            builder: (context, themeProviderValue, child) {
              return CustomSwitch(
                title: "Dark Mode",
                value: themeProviderValue.isDarkMode,
                onChangeValue: (value) {
                  themeProviderValue.toggle(value);
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomElevatedButton(title: "Clock 1"),
                CustomElevatedButton(title: "Clock 2"),
                CustomElevatedButton(title: "Clock 3"),
                CustomElevatedButton(title: "Clock 4"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: CustomElevatedButton(title: "Special Theme"),
          ),
          Consumer<TimeListView>(
            builder: (context, timeListViewValue, child) {
              return Column(
                children: [
                  RadioListTile(
                    title: const Text("Namaz Time: List View"),
                    value: 1,
                    onChanged: (value) {
                      timeListViewValue.toggle(value ?? 1);
                    },
                    groupValue: timeListViewValue.isListView,
                  ),
                  RadioListTile(
                    title: const Text("Namaz Time: Grid View"),
                    value: 2,
                    onChanged: (value) {
                      timeListViewValue.toggle(value ?? 2);
                    },
                    groupValue: timeListViewValue.isListView,
                  ),
                ],
              );
            },
          ),
          Consumer<ToDoProvider>(
            builder: (context, toDoValue, child) {
              return CustomSwitch(
                title: "Friday To Do List",
                value: toDoValue.isToDo,
                onChangeValue: (value) {
                  toDoValue.toggle(value);
                },
              );
            },
          ),
          Consumer<HadisProvider>(
            builder: (context, hadisValue, child) {
              return CustomSwitch(
                title: "Hadith of the Prophet Muhammad (saws)",
                value: hadisValue.isHadis,
                onChangeValue: (value) {
                  hadisValue.toggle(value);
                },
              );
            },
          ),
          SizedBox(height: 10),
          Consumer<HadisProvider>(
            builder: (context, hadisProvider, child) {
              return Visibility(
                visible: hadisProvider.isHadis,
                child: Consumer<HadisTimer>(
                  builder: (context, hadisTimerValue, child) {
                    return DropdownButton(
                      items: _hadisItems.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text("shows every $item Seconds"),
                        );
                      }).toList(),
                      onChanged: (value) {
                        hadisTimerValue.toggle(value as int);
                      },
                      value: hadisTimerValue.hadisValue,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      isExpanded: true,
                    );
                  },
                ),
              );
            },
          ),
          SizedBox(height: 10),
          Consumer<ToDoProvider>(
            builder: (context, toDoValue, child) {
              return Consumer<HadisProvider>(
                builder: (context, hadisValue, child) {
                  return Visibility(
                    visible:
                        toDoValue.isToDo && hadisValue.isHadis ? true : false,
                    child: Consumer<FridayHadisProvider>(
                      builder: (context, FridayHadisValue, child) {
                        return CustomSwitch(
                          title: "Are hadith shown on Jumuʽah?",
                          value: FridayHadisValue.isFridayHadis,
                          onChangeValue: (value) {
                            FridayHadisValue.toggle(value);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          Consumer<DonationProvider>(
            builder: (context, donationValue, child) {
              return CustomSwitch(
                title: "Donation Screen",
                value: donationValue.isDonation,
                onChangeValue: (value) {
                  donationValue.toggle(value);
                },
              );
            },
          ),
          Divider(),
          DrawerDataTitle(title: "Edit Details"),
          ListTile(
            leading: Icon(Icons.insert_drive_file),
            title: const Text("Account Details"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.timelapse),
            title: const Text("Namaz Time"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Log Out"),
            trailing: Icon(Icons.logout),
            onTap: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  CustomElevatedButton({required String title}) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }

  DrawerDataTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }
}
