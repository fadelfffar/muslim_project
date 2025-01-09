import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_project/networking/prayer_response.dart';

Future<Prayer> ApiBaseHelper() async {
  final datenow = DateTime.now();
  final currentdate = "$datenow".split(" ");
  try {
    print(currentdate[0]);
    final response = await http
      .get(Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1420/${currentdate[0]}'));
      if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response);
    return Prayer.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // await ApiBaseHelper().catchError(print);
    throw Exception('Failed to load prayer data');
  }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}

// void main() async {
//   final httpPrayerUrl = Uri.http('https://api.myquran.com/v2/sholat/jadwal/1420/2025-01-05');

//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     final httpPrayerResponse = await http.read(httpPrayerUrl);
//     final httpPrayerJson = json.decode(httpPrayerResponse) as Map<String, dynamic>;
//     print(httpPrayerJson);
    
// }
// Future<Prayer> ApiBaseHelper() async {
//   final response = await http
//       .get(Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1420/2025-01-05'));

//   final packageUrl = Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1420/2025-01-05');
//   // final packageResponse = await http.get(packageUrl);

//   // If the request didn't succeed, throw an exception

//   return Prayer.fromJson(packageUrl as Map<String, dynamic>);
// }
  
// class PackageRetrievalException implements Exception {
//   final int? statusCode;

//   PackageRetrievalException({this.statusCode});
// }