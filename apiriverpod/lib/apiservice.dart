import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'model/Ansaf.dart';
import 'model/Products.dart';

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

final apiprovider = Provider<Apiserviceee>((ref) => Apiserviceee());
