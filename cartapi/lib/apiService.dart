import 'dart:convert';

import 'package:cartapi/model/Response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/Carts.dart';

class Apiservice {
  Future<List<Carts>?> fetchcartdata() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/carts"));
    var jsonn = jsonDecode(response.body);
    var data = Response.fromJson(jsonn);
    var list = data.carts;
    return list;
  }
}
