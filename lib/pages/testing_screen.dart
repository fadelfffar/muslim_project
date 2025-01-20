// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TestingScreen extends StatefulWidget {
//   const TestingScreen({super.key});

//   @override
//   State<TestingScreen> createState() => _TestingScreenState();
// }

// class _TestingScreenState extends State<TestingScreen> {
//   // Get battery level.
// String _batteryLevel = 'Unknown battery level.';

// Future<void> _getBatteryLevel() async {
//   String batteryLevel;
//   try {
//     final result = await platform.invokeMethod<int>('getBatteryLevel');
//     batteryLevel = 'Battery level at $result % .';
//   } on PlatformException catch (e) {
//     batteryLevel = "Failed to get battery level: '${e.message}'.";
//   }

//   setState(() {
//     _batteryLevel = batteryLevel;
//   });
// }
//   static const platform = MethodChannel('com.example.muslim_project/app_data');
//   @override
// Widget build(BuildContext context) {
//   return Material(
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             onPressed: _getBatteryLevel,
//             child: const Text('Get Battery Level'),
//           ),
//           Text(_batteryLevel),
//         ],
//       ),
//     ),
//   );
// }
// }