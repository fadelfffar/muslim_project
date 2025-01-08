import 'package:flutter/material.dart';
import 'package:muslim_project/networking/api_base_helper.dart';
import 'package:muslim_project/networking/prayer_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Prayer> futurePrayer;
  @override
  void initState() {
    super.initState();
    futurePrayer = ApiBaseHelper();
  }
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
        constraints: BoxConstraints.expand(width: 2400, height: 1200),
        child: Column(
          children: [
            Text(
              "Selamat Datang di Website Lentera Istiqomah",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              "Media Dakwah Masjid Al Istiqomah Purbalingga\nPancarkan Cahaya Ilmu Tenangkan Jiwa",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),
            // shows daily prayer time
            FutureBuilder(
              future: futurePrayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                } else if(snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  // TODO: fix how to show data
                  // TODO: change to use ListView -> ListTile -> leading and title
                  return Row(
                    // Problem: if axis is horizontal, the data is not showing not because same colors issue, but unknown problem, should I just use it vertically instead???
                    // Card(
                    //     child: ListTile(
                    //       leading: Image.asset("assets/icon-imsyak.png", width: 80, height: 80,),
                    //       title: Text(snapshot.data!.imsak)
                    //     ),
                    //   )
                    children: [
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-imsyak.png", width: 80, height: 80,),
                            title: Text(
                              "Imsak",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.imsak,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-subuh.png", width: 80, height: 80,),
                            title: Text(
                              "Subuh",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.imsak,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-syuruq.png", width: 80, height: 80,),
                            title: Text(
                              "Syuruq",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.imsak,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-dzuhur.png", width: 80, height: 80,),
                            title: Text(
                              "Dzuhur",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.dzuhur,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-ashar.png", width: 80, height: 80,),
                            title: Text(
                              "Ashar",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.ashar,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-maghrib.png", width: 80, height: 80,),
                            title: Text(
                              "Maghrib",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.maghrib,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-isya.png", width: 80, height: 80,),
                            title: Text(
                              "Isya",
                              style: TextStyle(
                                color: Color(0xff778288),
                                fontSize: 24,
                                fontWeight: FontWeight.w400
                              ),),
                            trailing: Text(
                              snapshot.data!.isya,
                              style: TextStyle(
                                color: Color(
                                  0xff474E52,),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),),
                          ),
                        ),
                      ),
                      // TODO: turn this into a card
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.tanggal)),
                      // Card(
                      //   child: Text(snapshot.data!.imsak)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.subuh)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.terbit)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.dzuhur)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.ashar)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.maghrib)),
                      // Card(
                      //   color: Colors.blue,
                      //   child: Text(snapshot.data!.isya)),
                    ],
                  );
                } else {
                  return const Text("No data available");
                }
              }
            ),
            const SizedBox(height: 50,),
            Text("Community & Partners",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary
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