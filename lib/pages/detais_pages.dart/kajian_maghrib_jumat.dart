import 'package:flutter/material.dart';

class KajianMaghribJumatScreen extends StatefulWidget {
  const KajianMaghribJumatScreen({super.key});

  @override
  State<KajianMaghribJumatScreen> createState() => _KajianMaghribJumatScreenState();
}

class _KajianMaghribJumatScreenState extends State<KajianMaghribJumatScreen> {
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
                      Text("Jumat Pekan pertama"),
                      Text("tanggal 7 Februari 2025"),
                      Text("Ustadz Liman Pujowaluyo S.Thi"),
                      Text("Tema : Kitab Minjahul Muslimin")
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
                      Text("Jumat Pekan kedua"),
                      Text("tanggal 14 Februari 2025"),
                      Text("Ustadz Liman Pujowaluyo S.Thi", textAlign: TextAlign.center,),
                      Text("Tema : Kitab Minjahul Muslimin")
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
                      Text("Jumat Pekan ketiga"),
                      Text("tanggal 21 Februari 2025"),
                      Text("Ustadz Liman Pujowaluyo S.Thi"),
                      Text("Tema : Kitab Minjahul Muslimin")
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
                      Text("Jumat Pekan keempat"),
                      Text("tanggal 28 Februari 2025"),
                      Text("Ustadz Liman Pujowaluyo S.Thi"),
                      Text("Tema : Kitab Minjahul Muslimin")
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