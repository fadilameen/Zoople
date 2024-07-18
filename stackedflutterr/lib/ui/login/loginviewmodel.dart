import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class Loginviewmodel extends BaseViewModel {
  TextEditingController controller1 = TextEditingController();
  void printdata() {
    print(controller1.text);
  }

  void fetchdata() {
    print("fetchingg.....");
  }
}
