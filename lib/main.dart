// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Muslim Hadits Quiz'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              TextField(),
              TextField(),
              TextField(),
              ElevatedButton(onPressed: () {}, child: Text("Button"))
            ],
          ),
        ),
      ),
    );
  }
}