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
        child: const Column(
          children: [
            SizedBox(height: 80),
            // shows daily prayer time
            Row(
              //TODO: make each Column inside a Card or Container with a backgroundColor
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Fajr"),
                    Text("04:07"),
                  ],
                ),
                Column(
                  children: [
                    Text("Dhuhr"),
                    Text("12:44"),
                  ],
                ),
                Column(
                  children: [
                    Text("Ashr"),
                    Text("15:03"),
                  ],
                ),
                Column(
                  children: [
                    Text("Maghrb"),
                    Text("17:47"),
                  ],
                ),
                Column(
                  children: [
                    Text("Isya"),
                    Text("19:19"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Text("List of Mosque in your area"),
            SizedBox(height: 24,),
            ListBody(
              children: [
                Card(
                child: Column(
                  children: [
                    Text("Shows Mosque Name"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Image"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Address"),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text("Shows Mosque Name"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Image"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Address"),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text("Shows Mosque Name"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Image"),
                    SizedBox(height: 40),
                    Text("Shows Mosque Address"),
                  ],
                ),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}