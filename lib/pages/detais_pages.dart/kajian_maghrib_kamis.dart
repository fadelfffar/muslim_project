import 'package:flutter/material.dart';

class KajianMaghribKamisScreen extends StatefulWidget {
  const KajianMaghribKamisScreen({super.key});

  @override
  State<KajianMaghribKamisScreen> createState() => _KajianMaghribKamisScreenState();
}

class _KajianMaghribKamisScreenState extends State<KajianMaghribKamisScreen> {
  bool _customTileExpanded = false;
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
        padding: const EdgeInsets.all(20),
        color: const Color(0xff359D59),
        alignment: Alignment.center,
        child: const Column(
          children: [
            SizedBox(
              height: 120,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Kamis Pekan pertama"),
                      Text("tanggal 6 Februari 2025"),
                      Text("Ustadz Mujahid Aslam S.Pd (Alumni LIPIA)"),
                      Text("Tema : Tematik")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Kamis Pekan kedua"),
                      Text("tanggal 13 Februari 2025"),
                      Text("Ustadz Mujahid Aslam S.Pd (Alumni LIPIA)", textAlign: TextAlign.center,),
                      Text("Tema : Tematik")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Kamis Pekan ketiga"),
                      Text("tanggal 20 Februari 2025"),
                      Text("Ustadz Mujahid Aslam S.Pd (Alumni LIPIA)"),
                      Text("Tema : Tematik")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Kamis Pekan keempat"),
                      Text("tanggal 27 Februari 2025"),
                      Text("Ustadz Mujahid Aslam S.Pd (Alumni LIPIA)"),
                      Text("Tema : Tematik")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}