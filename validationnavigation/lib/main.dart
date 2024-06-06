// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:validationnavigation/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usrname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Signup"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(
              height: 70,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: usrname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "username",
                labelText: 'username',
                prefixIcon: Icon(Icons.search),
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ("name is empty");
                }
                if (value.contains('@')) {
                  return 'it is not a valid name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: age,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Age",
                labelText: 'Age',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ("Age is empty");
                }
                int age = int.tryParse(value)!;
                if (age < 18) {
                  return "Age must be greater than 18";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Email",
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return ("email is empty");
                }
                if (!value.contains('@')) {
                  return 'Not a valid email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Phone Number",
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone)),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                if (value!.length != 10) {
                  return ("Phone Number is Invalid");
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'password cannot be empty';
                }
                if (value.length < 8) {
                  return ("Password must be greater than 8 characters");
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("validated successfully");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => userdetails(
                        name: usrname.text,
                        age: age.text,
                        email: email.text,
                        phone: phone.text,
                        password: password.text,
                      ),
                    ),
                  );
                }
              },
              child: Text("Login"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("SignUp"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
