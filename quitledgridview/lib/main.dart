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
  List<String> images = [
    "https://th.bing.com/th/id/OIP.0OHbAGENXBFABKmP7vML7AHaJZ?w=136&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.9aArEqaZkRF2Is2gYHQBjQHaEx?w=261&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.F5PTPLg2IFmY_-WtESzClgHaEK?w=287&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.0OHbAGENXBFABKmP7vML7AHaJZ?w=136&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.9aArEqaZkRF2Is2gYHQBjQHaEx?w=261&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.F5PTPLg2IFmY_-WtESzClgHaEK?w=287&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.0OHbAGENXBFABKmP7vML7AHaJZ?w=136&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.9aArEqaZkRF2Is2gYHQBjQHaEx?w=261&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.F5PTPLg2IFmY_-WtESzClgHaEK?w=287&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.0OHbAGENXBFABKmP7vML7AHaJZ?w=136&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.9aArEqaZkRF2Is2gYHQBjQHaEx?w=261&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.F5PTPLg2IFmY_-WtESzClgHaEK?w=287&h=180&c=7&r=0&o=5&pid=1.7",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Table(
      border: TableBorder.all(width: 1),
      children: [
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
        TableRow(
          children: [
            Text("Hi Fadil"),
            Text("Hi Fadil"),
            Text("Hi Fadil"),
          ],
        ),
      ],
    )
        //     GridView.custom(
        //   gridDelegate: SliverQuiltedGridDelegate(
        //     crossAxisCount: 4,
        //     mainAxisSpacing: 4,
        //     crossAxisSpacing: 4,
        //     repeatPattern: QuiltedGridRepeatPattern.inverted,
        //     pattern: [
        //       QuiltedGridTile(2, 2),
        //       QuiltedGridTile(1, 1),
        //       QuiltedGridTile(1, 1),
        //       QuiltedGridTile(1, 2),
        //     ],
        //   ),
        //   childrenDelegate: SliverChildBuilderDelegate(
        //     childCount: images.length,
        //     (context, index) => Tile(index: index, image: images[index]),
        //   ),
        // )
        );
  }
}

class Tile extends StatelessWidget {
  final int index;
  final String image;
  Tile({
    super.key,
    required this.index,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      child: Card(
        elevation: 1000,
        child: Tooltip(
          message: "suiiiii",
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
