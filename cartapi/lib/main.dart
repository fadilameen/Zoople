import 'package:cartapi/apiService.dart';
import 'package:flutter/material.dart';

import 'model/Carts.dart';

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
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiservice.fetchcartdata(),
        builder: (BuildContext context, AsyncSnapshot<List<Carts>?> snapshot) {
          if (snapshot.hasError) {
            return Text("errorr..");
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int cartindex) {
                return GridTile(
                    child: Card(
                  child: GridTile(
                    child: Center(
                        child: Text("${snapshot.data![cartindex].total}")),
                  ),
                ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
