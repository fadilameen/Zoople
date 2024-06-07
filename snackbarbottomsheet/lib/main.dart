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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void displaySnackBar(BuildContext context) {
    final snkbr = SnackBar(
      content: Text("Snack Bar"),
      action: SnackBarAction(
        label: "undo",
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snkbr);
  }

  void displayBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        width: double.infinity,
        color: Colors.green,
      ),
    );
  }

  void displayAlertBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("exittt"),
            content: Text("reallyy??"),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Yes"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("no"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              displaySnackBar(context);
            },
            child: Text("Show Snackbar"),
          ),
          ElevatedButton(
            onPressed: () {
              displayBottom(context);
            },
            child: Text("Show bottomsheet"),
          ),
          ElevatedButton(
            onPressed: () {
              displayAlertBox(context);
            },
            child: Text("Alert box"),
          ),
        ],
      ),
    );
  }
}
