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
  double size = 50;
  bool large = false;

  void updatesize() {
    setState(() {
      size = large ? 250 : 50;
      large = !large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  updatesize();
                },
                child: AnimatedSize(
                    curve: Curves.easeInOutBack,
                    duration: Duration(seconds: 2),
                    child: Container(
                      height: size,
                      width: size,
                      color: Colors.teal,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
