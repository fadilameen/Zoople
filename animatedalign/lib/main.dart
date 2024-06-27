import 'package:flutter/cupertino.dart';
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
  AlignmentGeometry _alignment = Alignment.topRight;
  void changeAlignment() {
    setState(() {
      _alignment = (_alignment == Alignment.topRight)
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _alignment,
              curve: Curves.easeInOutBack,
              duration: Duration(seconds: 3),
              child: Image(
                image: NetworkImage(
                    "https://wallpapers.com/images/high/messi-iphone-qfw3jhocr9xp8brd.webp"),
                height: 100,
                width: 75,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => changeAlignment(),
                child: Text("start"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
