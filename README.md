# Masjid Monitor - Your Ultimate Masjid Information Hub

Welcome to ***Masjid Monitor***, the essential Android app specially designed for Android TV, offering a seamless way to stay updated with all the vital information for the Muslim community. Whether you're at home or at the Masjid, Masjid Monitor ensures you never miss out on important religious updates.

## Key Features:
- **Real-Time Namaz Timings:** Stay informed with accurate and timely updates on prayer times for your specific Masjid. Know exactly when the next Iqamah (prayer) will take place, ensuring you never miss a prayer.

- **Daily Hadith:** Enhance your knowledge and spirituality with daily Hadith updates. Masjid Monitor delivers authentic Hadiths to inspire and guide you every day.

- **Friday To-Do:** Prepare for Jummah with our dedicated section that highlights essential tasks and Sunnahs to perform on Fridays. Make the most of this blessed day with our curated checklist.

- **Specially Designed for Masjids:** Masjid Monitor is optimized for Android TV, making it perfect for display monitors in Masjids. Easily accessible information ensures that all attendees stay informed and spiritually connected.

- **Community Announcements:** Stay up-to-date with important community announcements and events. Whether it’s a special lecture, charity drive, or community gathering, you’ll be the first to know.

- **User-Friendly Interface:** Our intuitive design ensures that information is easy to read and navigate, making it suitable for all age groups


## About:
Masjid Monitor transforms the way information is shared in Masjids, creating a more connected and informed community. Stay tuned for the launch of Masjid Monitor on Android TV and be prepared to experience a new era of convenience and spirituality.

Stay Connected. Stay Informed. Stay Blessed.

- **Getting Started:** This project is currently in development. Please check back for updates and the official release.

- **Contributing:** We welcome contributions to enhance Masjid Monitor. Please fork the repository and submit pull requests.

- **Contact:** For questions or more information, please contact us at adiltapadar@yahoo.com.
  




├── .gitignore
├── .metadata
├── README.md
├── analysis_options.yaml
├── android
    ├── .gitignore
    ├── app
    │   ├── build.gradle
    │   ├── google-services.json
    │   └── src
    │   │   ├── debug
    │   │       └── AndroidManifest.xml
    │   │   ├── main
    │   │       ├── AndroidManifest.xml
    │   │       ├── kotlin
    │   │       │   └── me
    │   │       │   │   └── adiltapadar
    │   │       │   │       └── masjidtv
    │   │       │   │           └── masjid_tv
    │   │       │   │               └── MainActivity.kt
    │   │       └── res
    │   │       │   ├── drawable-v21
    │   │       │       └── launch_background.xml
    │   │       │   ├── drawable
    │   │       │       └── launch_background.xml
    │   │       │   ├── mipmap-hdpi
    │   │       │       └── ic_launcher.png
    │   │       │   ├── mipmap-mdpi
    │   │       │       └── ic_launcher.png
    │   │       │   ├── mipmap-xhdpi
    │   │       │       └── ic_launcher.png
    │   │       │   ├── mipmap-xxhdpi
    │   │       │       └── ic_launcher.png
    │   │       │   ├── mipmap-xxxhdpi
    │   │       │       └── ic_launcher.png
    │   │       │   ├── values-night
    │   │       │       └── styles.xml
    │   │       │   └── values
    │   │       │       └── styles.xml
    │   │   └── profile
    │   │       └── AndroidManifest.xml
    ├── build.gradle
    ├── gradle.properties
    ├── gradle
    │   └── wrapper
    │   │   └── gradle-wrapper.properties
    └── settings.gradle
├── assets
    └── images
    │   ├── FridayToDo.jpg
    │   ├── bismillah.jpg
    │   ├── clock1.png
    │   ├── clock2.png
    │   ├── clock3.png
    │   ├── clock4.png
    │   ├── dark mode bismillah.png
    │   ├── darkFridayToDo.png
    │   ├── google.png
    │   ├── icon.png
    │   └── noProfile.png
├── lib
    ├── main.dart
    ├── providers
    │   ├── darkModeProvider.dart
    │   ├── donationProvider.dart
    │   ├── fridayHadisProvider.dart
    │   ├── hadisProvider.dart
    │   ├── hadisTimer.dart
    │   ├── passVisible.dart
    │   ├── stepperProvider.dart
    │   ├── textFieldProvider.dart
    │   ├── timeListView.dart
    │   └── toDoProvider.dart
    ├── screens
    │   ├── homeScreen
    │   │   ├── homeScreen.dart
    │   │   └── sections
    │   │   │   ├── clockSection.dart
    │   │   │   ├── donation.dart
    │   │   │   ├── fridayToDo.dart
    │   │   │   ├── hadis.dart
    │   │   │   ├── namazTime.dart
    │   │   │   ├── namazTimeGrid.dart
    │   │   │   ├── namazTimeVer.dart
    │   │   │   └── timerScreen.dart
    │   ├── loginScreen
    │   │   ├── LoginScreen.dart
    │   │   ├── loginUi
    │   │   │   └── loginUi.dart
    │   │   └── registerScreen.dart
    │   └── splashScreen.dart
    ├── services
    │   ├── fireStore
    │   │   └── firestoreService.dart
    │   └── googleSignInProvider.dart
    └── widgets
    │   ├── clock
    │       ├── angle.dart
    │       ├── clock.dart
    │       ├── digitalClock.dart
    │       ├── dot.dart
    │       ├── hour.dart
    │       ├── minute.dart
    │       └── second.dart
    │   ├── customSwitch.dart
    │   ├── customTextField.dart
    │   └── myDrawer.dart
├── pubspec.lock
├── pubspec.yaml
├── test
    └── widget_test.dart
└── web
    ├── favicon.png
    ├── icons
        ├── Icon-192.png
        ├── Icon-512.png
        ├── Icon-maskable-192.png
        └── Icon-maskable-512.png
    ├── index.html
    └── manifest.json
