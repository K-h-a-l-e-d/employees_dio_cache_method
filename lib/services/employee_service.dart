import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeService {
  //api endpoint
  String url = 'https://boringapi.com/api/v1/employees/';

  Future<void> fetchAndCacheEmployees() async {
    try {
      //fetching data from the api as json
      Response responseAsJson = await Dio().get(url);
      //converting the json response  back to a string which will be cached
      var responseAsString = jsonEncode(responseAsJson.data);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('cachedEmployeesData', responseAsString);

      // catching any exception in case of any unsuccessful response
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
