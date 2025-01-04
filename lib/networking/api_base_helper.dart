import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final Uri _baseUrl = "https://api.myquran.com/v2/sholat/jadwal/1420/2025-01-05" as Uri;
Future<dynamic> get() async {
    // print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(_baseUrl);
      // TODO: make sure if the data needs JsonParsing or not
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw Exception("Failed to get schedule");
    }
    print('api getPraySchedule received!');
    return responseJson;
  }
dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
  // TODO: make data class generator
  // TODO: fetch the data (doc url: https://docs.flutter.dev/cookbook/networking/fetch-data)
  // TODO: display the data
}