import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muslim_Project"),
      ),
      body: Column(
        children: [
          const Text("Berlin Turk Sehitlik Camii",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          const SizedBox(height: 40),
          Image.asset("/assets/sehitlik_mosque_berlin-neukolln_dw.jpg", width: 160, height: 80,),
          const SizedBox(height: 40),
          const Text("Shows Mosque Address",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          const SizedBox(height: 40),
          const Text("Shows Mosque History",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text(
                " Inspired by India: the Berlin Mosque, which is surrounded by residential homes in Berlin's Wilmersdorf district, is the oldest surviving mosque in Germany. It belongs to the Ahmadiyya community and was officially opened in 1928. Modelled on the Taj Mahal in India, it was designed by German architect Karl August Herrmann. ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              )),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          const SizedBox(height: 40),
          const Text("Shows Mosque Event"),
        ],
      ),
    );
  }
}