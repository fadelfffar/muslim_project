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
        //// define second appbar height
        /// uncomment below to show background image with opacity
        // bottom: PreferredSize(
          // TODO: fix prefSize height from appBar
            // preferredSize:  const Size.fromHeight(48),
            // child: Opacity(
            //   opacity: 0.3,
              // child: Stack(
              //   children: [
              //     Image.asset(
              //       "assets/header-masjid.png",
              //       fit: BoxFit.cover,
              //       // ACTION: add Image scale and multiply by 10
              //       scale: 0.1,
              //     ),
              //     ClipRRect(
              //       clipBehavior: Clip.antiAlias,
              //     ),
              //   ],
              // ),
            // ),
          // ),
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
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 50,),
          const Text("Community & Partners",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
          ),
          const Text("Berikut adalah komunitas dan kemitraan kami untuk senantiasa bersinergi dalam kebaikan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo-bim.png", width: 120, height: 120,),
              const SizedBox(width: 40,),
              Image.asset("assets/logo-revation-foundation.jpg", width: 120, height: 120,),
              const SizedBox(width: 40,),
              Image.asset("assets/logo-lattov.png", width: 120, height: 120,),
              const SizedBox(width: 40,),
              Image.asset("assets/logo-undang-dang.png", width: 120, height: 120,),
              const SizedBox(width: 40,),
              Image.asset("assets/logo-yoga-ekatama.png", width: 120, height: 120,),
              const SizedBox(width: 40,),
              Image.asset("assets/logo-utsman-bin-affan.png", width: 120, height: 120,),
              const SizedBox(width: 40,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}