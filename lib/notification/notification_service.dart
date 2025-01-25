import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

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
  // final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  // tz.initializeTimeZones();
    // optional: set local time zone, use with flutter_timezone
    // tz.setLocalLocation(tz.getLocation("Asia/Jakarta"));

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
    await notificationPlugin.show(
      id,
      title,
      body,
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id', 'your channel name',
          channelDescription: 'your channel description'),
      ),
      // androidScheduleMode: AndroidScheduleMode.exact,
    );
  }
}