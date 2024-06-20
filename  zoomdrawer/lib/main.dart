import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final drawerController = ZoomDrawerController();

  List<Widget> pages = [H1(), H2(), H3()];
  late int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
            onPressed: () {
              drawerController.toggle!();
            },
            icon: Icon(Icons.menu)),
      ),
      body: ZoomDrawer(
        controller: drawerController,
        menuScreen: Container(
          height: double.infinity,
          width: 200,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("H1"),
                onTap: () {
                  setState(() {
                    currentindex = 0;
                    drawerController.toggle!();
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.ac_unit_rounded),
                title: Text("H2"),
                onTap: () {
                  setState(() {
                    currentindex = 1;
                    drawerController.toggle!();
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.adb_sharp),
                title: Text("H3"),
                onTap: () {
                  setState(() {
                    currentindex = 2;
                    drawerController.toggle!();
                  });
                },
              ),
            ],
          ),
        ),
        mainScreen: pages[currentindex],
        borderRadius: 24.0,
        showShadow: false,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  const H1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class H2 extends StatelessWidget {
  const H2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class H3 extends StatelessWidget {
  const H3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
