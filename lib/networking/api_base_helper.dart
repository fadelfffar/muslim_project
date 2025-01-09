import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_project/networking/prayer_response.dart';

Future<Prayer> ApiBaseHelper() async {
  // Get the current date using DateTime.now(), example output "2025-01-09 22:59:24.702"
  final datenow = DateTime.now();
  // split datenow into two independent index
  final currentdate = "$datenow".split(" ");
  // get the first index of the current date
  final justdate = currentdate[0];
  try {
    final response = await http
      .get(Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1420/${justdate}'));
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