import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void displayAlertBox(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Log In"),
            content: Column(
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: "Enter Your Email"),
                ),
                TextField(
                  controller: pass,
                  decoration: InputDecoration(hintText: "Enter Password"),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Log In"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                displayAlertBox(context);
              },
              child: Text("Alert box"),
            ),
            ElevatedButton(
              onPressed: () async {
                confirmAction? c = await confirmed(context);
                print(c);
              },
              child: Text("show confirmation alert"),
            ),
            ElevatedButton(
              onPressed: () async {
                product? b = await Optionsalert(context);
                print(b);
              },
              child: Text("OptionsAlert"),
            ),
          ],
        ),
      ),
    );
  }
}

enum confirmAction { cancel, delete }

Future<confirmAction?> confirmed(BuildContext context) async {
  return showDialog<confirmAction>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("confirm??"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(confirmAction.cancel);
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(confirmAction.delete);
            },
            child: Text("delete"),
          ),
        ],
      );
    },
  );
}

enum product {
  apple,
  samsung,
  xiomi,
}

Future<product?> Optionsalert(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("select from below"),
        children: [
          SimpleDialogOption(
            child: Text("Apple"),
            onPressed: () {
              Navigator.pop(context, product.apple);
            },
          ),
          SimpleDialogOption(
            child: Text("Samsumg"),
            onPressed: () {
              Navigator.pop(context, product.samsung);
            },
          ),
          SimpleDialogOption(
            child: Text("Xiomi"),
            onPressed: () {
              Navigator.pop(context, product.xiomi);
            },
          ),
        ],
      );
    },
  );
}
