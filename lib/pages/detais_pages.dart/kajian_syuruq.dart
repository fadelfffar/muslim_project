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
              height: 160,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Ahad Pekan pertama"),
                      Text("tanggal 2 Februari 2025"),
                      Text("Ustadz Ahmad Fauzan S.Si Hafidzahullahu ta'ala"),
                      Text("Tema : Riba, Dosa Besar Yang Menghancurkan")
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
                      Text("Ahad Pekan kedua"),
                      Text("tanggal 9 Februari 2025"),
                      Text("Ustadz Agung Hidayah Saefullah, C.LQ Hafidzahullahu ta'ala", textAlign: TextAlign.center,),
                      Text("Tema : Ruqoyyah Putri Rosulullah")
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
                      Text("Ahad Pekan ketiga"),
                      Text("tanggal 16 Februari 2025"),
                      Text("Ustadz Agus Priyanto Hafidzahullahu ta'ala"),
                      Text("Tema : Etika Bersilaturahmi")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 160,
              width: 400,
              child: Card(
                color: Color(0xffF9FCF2),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Ahad Pekan keempat"),
                      Text("tanggal 23 Februari 2025"),
                      Text("Ustadz Abu Ukasyah A.Md Hafidzahullahu ta'ala"),
                      Text("Tema : Kewajiban dalam Islam")
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