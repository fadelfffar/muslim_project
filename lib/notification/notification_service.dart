import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  int randomId = Random().nextInt(1000);

  // Initialization
  Future<void> initNotification() async {
    if (_isInitialized) return; // prevent re-initialization

  // prepare android initialization
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
  
  // time zone initialization
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.initializeTimeZones();
  // Starting in version 2.0 of the plugin, scheduling notifications now requires 
  // developers to specify a date and time relative to a specific time zone.
  // required: set local time zone, use with flutter_timezone
  // TODO: test time_zone
  tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

  // prepare iOS initialization
  const initSettingsIOs = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // init settings
  const initializationSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOs,
  );

  // finally initialize the plugin
  await notificationPlugin.initialize(initializationSettings);

  }
  // Notification Detail Setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        '13321',
        'Daily Notification',
        channelDescription: 'Daily Notification Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        // IMPORTANT : add this icon declaration for notification initalization safety :)
        icon: '@mipmap/ic_launcher'
        ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // Show Notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body
  }) async {
    notificationPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id', 'your channel name',
          channelDescription: 'your channel description'),
      ),
    );
  }

  // Show Scheduled Notification
  void showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    required String scheduledTime,
  }) async {
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.parse(tz.local, scheduledTime),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id $randomId', 'your channel name',
          channelDescription: 'your channel description',
          // priority: Priority.high,
          // importance: Importance.high,
          ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
    // Print scheduledTime to log
    stderr.writeln('scheduled time : ${scheduledTime}');
    developer.log("scheduled time : ${scheduledTime}");
  }
}