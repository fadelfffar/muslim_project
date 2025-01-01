// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muslim_project/pages/home_screen.dart';
import 'package:muslim_project/pages/quiz_screen.dart';
import 'package:muslim_project/pages/ustadz_schedule_page.dart';

void main() {
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
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/home',
      routes:
      {
        '/home': (context) => HomeScreen(),
        '/': (context) => QuizScreen(),
        '/view': (context) => ExampleApp(),
      },
    );
  }
}