import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class Loginviewmodel extends BaseViewModel {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      print(namecontroller.text);
    }
  }

  void fetchdata() {
    print("fetchingg.....");
  }
}
