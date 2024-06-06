import 'package:flutter/material.dart';

class userdetails extends StatelessWidget {
  late String name, email, phone, password;
  late String age;
  userdetails(
      {super.key,
      required this.name,
      required this.age,
      required this.email,
      required this.phone,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: ListView(
        children: [
          ListTile(title: Text(name)),
          ListTile(title: Text(age)),
          ListTile(title: Text(email)),
          ListTile(title: Text(phone)),
          ListTile(title: Text(password)),
        ],
      ),
    );
  }
}
