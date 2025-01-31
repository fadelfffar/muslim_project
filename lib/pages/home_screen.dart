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
        backgroundColor: const Color(0xff8FC332),
        indicatorColor: const Color(0xffF9FCF2),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black,),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.schedule, color: Colors.black,),
            label: 'Jadwal',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings, color: Colors.black,),
            label: 'Pengaturan',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xffB7E369),
        constraints: const BoxConstraints.expand(width: 2400, height: 800),
        child: ListView(
          children: [
            Text(
              "Selamat Datang di Website Lentera Istiqomah",
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
      Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text("Segera Hadir", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
        ),
      ),
      Container(
        padding: EdgeInsets.all(16),
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
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().showScheduledNotification(
                            id: Random().nextInt(1000),
                            title: "Subuh Prayer Time is coming in 30 minutes",
                            body: "Subuh is at ${snapshot.data!.subuh}",
                            // scheduledTime is the same as the current prayer scheduled time
                            scheduledTime: "${justdate} ${snapshot.data!.subuh}"
                            );
                          },
                        child: Text("Make an Reminder 30 Minutes before Subuh time")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().showScheduledNotification(
                            id: Random().nextInt(1000),
                            title: "Dzuhur Prayer Time is coming in 30 minutes",
                            body: "Dzuhur is at ${snapshot.data!.dzuhur}",
                            // scheduledTime is the same as the current prayer scheduled time
                            scheduledTime: "${justdate} ${snapshot.data!.dzuhur}"
                            );
                          },
                        child: Text("Make an Reminder 30 Minutes before Dzuhur time")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().showScheduledNotification(
                            id: Random().nextInt(1000),
                            title: "Ashar Prayer Time is coming in 30 minutes",
                            body: "Ashar is at ${snapshot.data!.ashar}",
                            // scheduledTime is the same as the current prayer scheduled time
                            scheduledTime: "${justdate} ${snapshot.data!.ashar}"
                            );
                          },
                        child: Text("Make an Reminder 30 Minutes before Ashar time")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().showScheduledNotification(
                            id: Random().nextInt(1000),
                            title: "Maghrib Prayer Time is coming in 30 minutes",
                            body: "Maghrib is at ${snapshot.data!.maghrib}",
                            // scheduledTime is the same as the current prayer scheduled time
                            scheduledTime: "${justdate} ${snapshot.data!.maghrib}"
                            );
                          },
                        child: Text("Make an Reminder 30 Minutes before Maghrib time")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().showScheduledNotification(
                            id: Random().nextInt(1000),
                            title: "Ashar Prayer Time is coming in 30 minutes",
                            body: "Isya is at ${snapshot.data!.isya}",
                            // scheduledTime is the same as the current prayer scheduled time
                            scheduledTime: "${justdate} ${snapshot.data!.isya}"
                            );
                          },
                        child: Text("Make an Reminder 30 Minutes before Isya time")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NotificationService().cancelAllNotifications();
                        }, child: Text("cancel all notifications"))
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
        )
      ][currentPageIndex],
    );
  }
}