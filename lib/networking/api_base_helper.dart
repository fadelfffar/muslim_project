import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muslim_project/networking/prayer_response.dart';

Future<dynamic> ApiBaseHelper() async {
  final response = await http
      .get(Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1420/2025-01-05'));

  
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Prayer.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}