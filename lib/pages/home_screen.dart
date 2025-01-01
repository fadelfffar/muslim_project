import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        toolbarHeight: 180,
        leading: Image.asset("assets/logo-lentera.png", width: 48, height: 48,),
        title: const Text(
          "Lentera Istiqomah",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Container(
              // give padding inside the widget
              //// define second appbar height
              // height: 100,
              width: 428,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/header-masjid.png",
                    scale: 1,
                    fit: BoxFit.fill,
                  ),
                  // ClipRRect(
                  //   child: BackdropFilter(
                  //     filter: ImageFilter.blur(),
                  //     child: Container(
                  //       color: Colors.black38,
                  //     ),),
                  // ),
                ],
              ),
            )
          ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.lightGreen.shade300,
        child: Column(
          children: [
            const Text(
              "Selamat Datang di Website Lentera Istiqomah",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              "Media Dakwah Masjid Al Istiqomah Purbalingga\nPancarkan Cahaya Ilmu Tenangkan Jiwa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 80),
            // shows daily prayer time
            Row(
              //TODO: make each Column inside a Card or Container with a backgroundColor
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/icon-imsyak.png", width: 80, height: 80,),
                    const Text("Imsak"),
                    const Text("03:57"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-subuh.png", width: 80, height: 80,),
                    const Text("Subuh"),
                    const Text("04:07"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-syuruq.png", width: 80, height: 80,),
                    const Text("Syuruq"),
                    const Text("05:28"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-dhuha.png", width: 80, height: 80,),
                    const Text("Dhuha"),
                    const Text("05:56"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/icon-dzuhur.png", width: 80, height: 80,),
                    const Text("Dhuhr"),
                    const Text("12:44"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-ashar.png", width: 80, height: 80,),
                    const Text("Ashr"),
                    const Text("15:03"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-maghrib.png", width: 80, height: 80,),
                    const Text("Maghrb"),
                    const Text("17:47"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icon-isya.png", width: 80, height: 80,),
                    const Text("Isya"),
                    const Text("19:19"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text("List of Mosque in your area"),
            const SizedBox(height: 80,),
            const ListBody(
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
              // Card(
              //   child: Column(
              //     children:
              //       [
              //       Text("Shows Mosque Name"),
              //       SizedBox(height: 40),
              //       Text("Shows Mosque Image"),
              //       SizedBox(height: 40),
              //       Text("Shows Mosque Address"),
              //       ],
              //     ),
              //   ),
              ],
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Test"),
              )
          ],
        ),
      ),
    );
  }
}