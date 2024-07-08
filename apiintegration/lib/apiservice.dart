import 'dart:convert';

import 'package:apiintegration/model/Ansaf.dart';
import 'package:apiintegration/model/Products.dart';
import 'package:http/http.dart' as http;

class Apiserviceee {
  Future<List<Products>?> fetchdata() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonnnn = jsonDecode(response.body);
    var data = Ansaf.fromJson(jsonnnn);
    var list = data.products;
    return list;
  }
}
