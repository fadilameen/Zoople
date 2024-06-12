import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  List<String> names = [
    "fadil",
    "ameen",
    "Ansaf",
    "Nihal",
    "Muhammed",
    "Shehzad",
    "fadil",
    "ameen",
    "Ansaf",
    "Nihal",
    "Muhammed",
    "Shehzad",
    "fadil",
    "ameen",
    "Ansaf",
    "Nihal",
    "Muhammed",
    "Shehzad",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Tile(
              index: index, extent: (index % 5 + 1) * 100, names: names[index]);
        },
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  final double extent;
  final String names;
  Tile({
    super.key,
    required this.index,
    required this.extent,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      color: Colors.blue,
      child: Center(child: Text(names)),
    );
  }
}
