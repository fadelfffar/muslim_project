import 'package:flutter/material.dart';

class KajianSyuruqScreen extends StatefulWidget {
  const KajianSyuruqScreen({super.key});

  @override
  State<KajianSyuruqScreen> createState() => _KajianSyuruqScreenState();
}

class _KajianSyuruqScreenState extends State<KajianSyuruqScreen> {
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
        child: const Icon(Icons.navigate_before),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xff359D59),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Card(
              color: Color(0xffF9FCF2),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Ahad Pekan ketiga tanggal 16 Februari 2025"),
                    Text("Ustadz Agus Priyanto Hafidzahullahu ta'ala"),
                    Text("Tema : Etika Bersilaturahmi")
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xffF9FCF2),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Ahad Pekan ketiga tanggal 16 Februari 2025"),
                    Text("Ustadz Agus Priyanto Hafidzahullahu ta'ala"),
                    Text("Tema : Etika Bersilaturahmi")
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xffF9FCF2),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Ahad Pekan ketiga tanggal 16 Februari 2025"),
                    Text("Ustadz Agus Priyanto Hafidzahullahu ta'ala"),
                    Text("Tema : Etika Bersilaturahmi")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}