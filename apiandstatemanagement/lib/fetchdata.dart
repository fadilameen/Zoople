import 'package:apiandstatemanagement/apiservice.dart';
import 'package:flutter/cupertino.dart';

import 'model/Products.dart';

class ApiProviderr extends ChangeNotifier {
  List<Products>? list = [];
  Future<void> getDataa() async {
    Apiservicee apiservicee = Apiservicee();
    list = await apiservicee.fetchdata();
    notifyListeners();
  }
}
