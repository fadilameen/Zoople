import 'dart:convert';

import 'package:apiandstatemanagement/model/Responsee.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'model/Products.dart';

class Apiservicee extends ChangeNotifier {
  Future<List<Products>?> fetchdata() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonnnn = jsonDecode(response.body);
    var data = Responsee.fromJson(jsonnnn);
    var list = data.products;
    return list;
  }
}
