import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  late FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void showToast() {
    fToast.showToast(
      toastDuration: Duration(seconds: 3),
      gravity: ToastGravity.BOTTOM,
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(child: Text("simple toast")),
      ),
    );
  }

  void showToast2() {
    fToast.showToast(
      toastDuration: Duration(seconds: 5),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 200,
          left: 200,
        );
      },
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(child: Text("simple toast")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showToast();
              },
              child: Text("Toast"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showToast2();
                },
                child: Text("Toast2"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
