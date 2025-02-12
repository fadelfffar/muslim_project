import 'package:flutter/material.dart';

class TahsinIkwanScreen extends StatefulWidget {
  const TahsinIkwanScreen({super.key});

  @override
  State<TahsinIkwanScreen> createState() => _TahsinIkwanScreenState();
}

class _TahsinIkwanScreenState extends State<TahsinIkwanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black,
        toolbarHeight: 90,
        leading: Image.asset("assets/logo-lentera.png", scale: 0.1,),
        title: const Text(
          "Lentera Istiqomah",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: const Color(0xff1A7149),
        foregroundColor: const Color(0xffDAFAD8),
        child: const Icon(Icons.navigate_before),
      ),
      body: Container(
        color: const Color(0xff359D59),
        child: const Center(
          child: Text("Coming Soon", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    );
  }
}