import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muslim_Project"),
      ),
      body: Column(
        children: [
          Card(
                color: const Color(0xffF9FCF2),
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
                color: const Color(0xffF9FCF2),
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
                color: const Color(0xffF9FCF2),
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
    );
  }
}