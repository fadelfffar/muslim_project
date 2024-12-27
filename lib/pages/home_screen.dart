import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen.shade300,
        child: Column(
          children: [
            Text("Home Screen"),
          ],
        ),
      ),
    );
  }
}