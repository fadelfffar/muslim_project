// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muslim_project/notification/notification_service.dart';
import 'package:muslim_project/pages/detais_pages.dart/jadwal_terawih.dart';
import 'package:muslim_project/pages/detais_pages.dart/kajian_syuruq.dart';
import 'package:muslim_project/pages/home_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'pages/detais_pages.dart/kajian_maghrib_jumat.dart';
import 'pages/detais_pages.dart/kajian_maghrib_kamis.dart';
import 'pages/detais_pages.dart/khutbah_jumat.dart';
import 'pages/detais_pages.dart/tahsin_akwan.dart';
import 'pages/detais_pages.dart/tahsin_ikwan.dart';

// mixin snapshot {
//   late Future<Prayer> futurePrayer;
// }

// Future<void> asharPrayer = NotificationService().showNotification(
//   id: Random().nextInt(1000),
//   title: "Dzuhur akan tiba dalam sekitar 30 menit",
//   body: "Waktu sholat Dzuhur tiba pada ${snapshot.data!.dzuhur}",
  // scheduledTime is the same as the current prayer scheduled time
  // scheduledTime: "${justdate} ${snapshot.data!.dzuhur}"
// );

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  
  // init notification
  NotificationService().initNotification();
  // Don’t forget to call tz.initializeTimeZones() in your main() function. Missing this can lead to scheduling issues.
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var images = <Uint8List>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // Project wide Card themes, change this to change all card styles
        cardTheme: CardTheme(
          color: const Color(0xffF9FCF2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          height: 88,
          backgroundColor: Color(0xff1A7149),
          indicatorColor: Color(0xffF9FCF2),
          labelTextStyle: WidgetStatePropertyAll(TextStyle( color:  Color(0xffDAFAD8), fontWeight: FontWeight.w500)),
        ),
        listTileTheme: ListTileThemeData(
          minTileHeight: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          titleTextStyle: const TextStyle(
            color: Color(0xff778288),
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          subtitleTextStyle: const TextStyle(
            color: Color(0xff474E52,),
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        )
        // colorScheme: ColorScheme(
        //   brightness: Brightness.light,
        //   primary: const Color(0xff359D59),
        //   onPrimary: const Color(0xff1A7149),
        //   secondary: const Color(0xffB7E369),
        //   onSecondary: const Color(0xff8FC332),
        //   error: const Color.fromARGB(0, 50, 110, 195), onError: const Color.fromARGB(0, 55, 85, 2), surface: const Color.fromARGB(0, 158, 158, 158), onSurface: const Color.fromARGB(0, 156, 156, 156))
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/maghrib_senin': (context) => const TahsinIkwanScreen(),
        '/maghrib_selasa': (context) => const TahsinAkwanScreen(),
        '/maghrib_kamis': (context) => const KajianMaghribKamisScreen(),
        '/khutbah-jumat': (context) => const KhutbahJumatScreen(),
        '/maghrib_jumat': (context) => const KajianMaghribJumatScreen(),
        '/syuruq': (context) => const KajianSyuruqScreen(),
        '/jadwal_terawih': (context) => const JadwalTerawihScreen(),
      },
    );
  }
}