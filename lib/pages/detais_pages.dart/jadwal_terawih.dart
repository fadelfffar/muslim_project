import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class JadwalTerawihScreen extends StatefulWidget {
  const JadwalTerawihScreen({super.key});

  @override
  State<JadwalTerawihScreen> createState() => _JadwalTerawihScreenState();
}

class _JadwalTerawihScreenState extends State<JadwalTerawihScreen> {
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
      body: PhotoView(
        imageProvider: const AssetImage("assets/jadwal_terawih.png")),
    );
  }
}