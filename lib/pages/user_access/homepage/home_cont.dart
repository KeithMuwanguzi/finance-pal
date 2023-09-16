import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var items = [];
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    var data = [];
    try {
      final response = await http.get(Uri.parse('http:192.168.43.203:3000/'));
      if (response.statusCode == 200) {
        debugPrint('Everything is okay');
        data = json.decode(response.body);
        items = data;
      } else {
        debugPrint('Errors');
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return data;
  }
}
