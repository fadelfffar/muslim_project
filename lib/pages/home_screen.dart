import 'dart:math';

import 'package:flutter/material.dart';
import 'package:muslim_project/networking/api_base_helper.dart';
import 'package:muslim_project/networking/prayer_response.dart';
import 'package:muslim_project/notification/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int randomId = Random().nextInt(1000);
  int currentPageIndex = 0;
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
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xffF9FCF2),
        selectedIndex: currentPageIndex,
        // list of icons
        // shown by index
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black,),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.date_range_outlined, color: Colors.black,),
            label: 'Acara Masjid',
          ),
          NavigationDestination(
            icon: Icon(Icons.mosque_outlined, color: Colors.black,),
            label: 'Ramadan',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings, color: Colors.black,),
            label: 'Pengaturan',
          ),
        ],
      ),
      body: <Widget>[
        // list of icons
        // shown by index
        /// Home page
        Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xff359D59),
        constraints: const BoxConstraints.expand(width: 2400, height: 800),
        child: ListView(
          children: [
            Text(
              "Selamat Datang di Mobile Lentera Istiqomah",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              "Media Dakwah Masjid Al Istiqomah Purbalingga\nPancarkan Cahaya Ilmu Tenangkan Jiwa",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 12),
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
                  return Column(
                    mainAxisSize: MainAxisSize.values[0],
                    // Problem: if axis is horizontal, the data is not showing not because same colors issue, but unknown problem, should I just use it vertically instead???
                    children: [
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-imsyak.png", width: 24, height: 24,),
                            title: const Text(
                              "Imsak",
                            ),
                            subtitle: Text(
                              snapshot.data!.imsak,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-subuh.png", width: 24, height: 24,),
                            title: const Text(
                              "Subuh",
                            ),
                            subtitle: Text(
                              snapshot.data!.subuh,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-syuruq.png", width: 24, height: 24,),
                            title: const Text(
                              "Syuruq",
                            ),
                            subtitle: Text(
                              snapshot.data!.terbit,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-dzuhur.png", width: 24, height: 24,),
                            title: const Text(
                              "Dzuhur",
                            ),
                            subtitle: Text(
                              snapshot.data!.dzuhur,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-ashar.png", width: 24, height: 24,),
                            title: const Text(
                              "Ashar",),
                            subtitle: Text(
                              snapshot.data!.ashar,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-maghrib.png", width: 24, height: 24,),
                            title: const Text(
                              "Maghrib",
                            ),
                            subtitle: Text(
                              snapshot.data!.maghrib,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: const Color(0xffF9FCF2),
                          child:
                          ListTile(
                            leading: Image.asset("assets/icon-isya.png", width: 24, height: 24,),
                            title: const Text(
                              "Isya",
                            ),
                            subtitle: Text(
                              snapshot.data!.isya,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text("No data available");
                }
              }
            ),
          ],
        ),
      ),
      
        // Mosque Event Schedule
        Container(
          padding: const EdgeInsets.all(20),
          color: const Color(0xff359D59),
          constraints: const BoxConstraints.expand(width: 2400, height: 800),
          child:  ListView(
            // children: [
            //   Column(
            children: [
              const SizedBox(height: 40,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maghrib_senin');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-maghrib.png", width: 24, height: 24,),
                    title: const Text("Tahsin Ikwan Ba'da Maghrib Senin"),
                    subtitle: const Text("Setiap Senin Malam setelah sholat Maghrib"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maghrib_selasa');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-maghrib.png", width: 24, height: 24,),
                    title: const Text("Tahsin Akwan Ba'da Maghrib Selasa"),
                    subtitle: const Text("Setiap Selasa Malam setelah sholat Maghrib"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maghrib_kamis');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-dzuhur.png", width: 24, height: 24,),
                    title: const Text("Kajian Ba'da Maghrib Kamis"),
                    subtitle: const Text("Setiap Kamis Malam setelah sholat Maghrib"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maghrib_jumat');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-maghrib.png", width: 24, height: 24,),
                    title: const Text("Kajian Ba'da Maghrib Jumat"),
                    subtitle: const Text("Setiap Jumat malam setelah sholat Maghrib"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/khutbah-jumat');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-dzuhur.png", width: 24, height: 24,),
                    title: const Text("Kajian Khutbah Jum'at"),
                    subtitle: const Text("Setiap saat sholat fardhu a'in Jum'at"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color(0xffF9FCF2)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/syuruq');
                  },
                  child: ListTile(
                    leading: Image.asset("assets/icon-subuh.png", width: 24, height: 24,),
                    title: const Text("Kajian Syuruq"),
                    subtitle: const Text("Setiap Ahad pagi setelah sholat Subuh"),
                  )
                ),
              ),
              const SizedBox(height: 12,),
            ],
          ),
        ),

        // Ramadan Screen
        Container(
          color: const Color(0xff359D59),
          child: const Center(
            child: Text("Coming Soon", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ),
        // Reminder Settings Screen
        Container(
          padding: const EdgeInsets.all(20),
          color: const Color(0xff359D59),
          constraints: const BoxConstraints.expand(width: 2400, height: 800),
          child: Column(
            children: [
              FutureBuilder(
                future: futurePrayer,
                builder: (context, snapshot) {
                  // Get the current date using DateTime.now(), example output "2025-01-09 22:59:24.702"
                  final datenow = DateTime.now();
                  // split datenow into two independent index
                  final currentdate = "$datenow".split(" ");
                  // get the first index of the current date
                  final justdate = currentdate[0];
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 360,
                          child: Flexible(
                            fit: FlexFit.loose,
                            child: ElevatedButton(
                              onPressed: () {
                                NotificationService().showScheduledNotification(
                                  id: Random().nextInt(1000),
                                  title: "Subuh akan tiba dalam sekitar 30 menit",
                                  body: "Waktu sholat Subuh tiba pada ${snapshot.data!.subuh}",
                                  // scheduledTime is the same as the current prayer scheduled time
                                  scheduledTime: "${justdate} ${snapshot.data!.subuh}"
                                  );
                                NotificationService().showScheduledNotification(
                                  id: Random().nextInt(1000),
                                  title: "Dzuhur akan tiba dalam sekitar 30 menit",
                                  body: "Waktu sholat Dzuhur tiba pada ${snapshot.data!.dzuhur}",
                                  // scheduledTime is the same as the current prayer scheduled time
                                  scheduledTime: "${justdate} ${snapshot.data!.dzuhur}"
                                  );
                                NotificationService().showScheduledNotification(
                                  id: Random().nextInt(1000),
                                  title: "Ashar akan tiba dalam sekitar 30 menit",
                                  body: "Waktu sholat Ashar tiba pada Ashar ${snapshot.data!.ashar}",
                                  // scheduledTime is the same as the current prayer scheduled time
                                  scheduledTime: "${justdate} ${snapshot.data!.ashar}"
                                  );
                                NotificationService().showScheduledNotification(
                                  id: Random().nextInt(1000),
                                  title: "Maghrib akan tiba dalam sekitar 30 menit",
                                  body: "Waktu sholat Maghrib tiba pada ${snapshot.data!.maghrib}",
                                  // scheduledTime is the same as the current prayer scheduled time
                                  scheduledTime: "${justdate} ${snapshot.data!.maghrib}"
                                  );
                                NotificationService().showScheduledNotification(
                                  id: Random().nextInt(1000),
                                  title: "Isya akan tiba dalam sekitar 30 menit",
                                  body: "Waktu sholat Isya tiba pada ${snapshot.data!.isya}",
                                  // scheduledTime is the same as the current prayer scheduled time
                                  scheduledTime: "${justdate} ${snapshot.data!.isya}"
                                  );
                                },
                              style: const ButtonStyle(
                              fixedSize: WidgetStatePropertyAll(Size(360, 64)),
                          ),
                              child: const Text("Buat Pengingat 30 menit sebelum waktu sholat (semua 5 waktu)"),
                              // Text("Buat Pengingat 30 menit sebelum waktu sholat Subuh")
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        // Container(
                        //   decoration: ShapeDecoration(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.zero,
                        //     )
                        //   ),
                        //   child:
                        ElevatedButton(
                            onPressed: () {
                              NotificationService().cancelAllNotifications();
                            },
                            child: Text("Batalkan semua pengingat"),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Color(0xffF9FCF2)),
                              fixedSize: WidgetStatePropertyAll(Size(360, 64)),
                          ),
                        ),
                        // )
                        // ElevatedButton(
                        //   onPressed: () {
                        //     NotificationService().showNotification(
                        //       id: Random().nextInt(1000),
                        //       title: "Dzuhur akan tiba dalam sekitar 30 menit",
                        //       body: "Waktu sholat Dzuhur tiba pada ${snapshot.data!.dzuhur}",
                        //       // scheduledTime is the same as the current prayer scheduled time
                        //       // scheduledTime: "${justdate} ${snapshot.data!.dzuhur}"
                        //       );
                        //     },
                        //   child: Text("Buat Pengingat 30 menit sebelum waktu sholat Dzuhur")
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     NotificationService().showNotification(
                        //       id: Random().nextInt(1000),
                        //       title: "Ashar akan tiba dalam sekitar 30 menit",
                        //       body: "Waktu sholat Ashar tiba pada Ashar ${snapshot.data!.ashar}",
                        //       // scheduledTime is the same as the current prayer scheduled time
                        //       // scheduledTime: "${justdate} ${snapshot.data!.ashar}"
                        //       );
                        //     },
                        //   child: Text("Buat Pengingat 30 menit sebelum waktu sholat Ashar")
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     NotificationService().showNotification(
                        //       id: Random().nextInt(1000),
                        //       title: "Maghrib akan tiba dalam sekitar 30 menit",
                        //       body: "Waktu sholat Maghrib tiba pada ${snapshot.data!.maghrib}",
                        //       // scheduledTime is the same as the current prayer scheduled time
                        //       // scheduledTime: "${justdate} ${snapshot.data!.maghrib}"
                        //       );
                        //     },
                        //   child: Text("Buat Pengingat 30 menit sebelum waktu sholat Maghrib")
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     NotificationService().showNotification(
                        //       id: Random().nextInt(1000),
                        //       title: "Isya akan tiba dalam sekitar 30 menit",
                        //       body: "Waktu sholat Isya tiba pada ${snapshot.data!.isya}",
                        //       // scheduledTime is the same as the current prayer scheduled time
                        //       // scheduledTime: "${justdate} ${snapshot.data!.isya}"
                        //       );
                        //     },
                        //   child: Text("Buat Pengingat 30 menit sebelum waktu sholat Isya")
                        // ),
                      
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Text("No data available");
                        }
                      },
                    )
                  ],
                ),
              ),
      ][currentPageIndex],
    );
  }
}