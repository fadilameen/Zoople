import 'package:apiintegration/apiservice.dart';
import 'package:flutter/material.dart';

import 'model/Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Apiserviceee apiservicee = Apiserviceee();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiservicee.fetchdata(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${snapshot.data![index].thumbnail}"),
                    ),
                    title: Text("${snapshot.data![index].title}"),
                    subtitle: Text("${snapshot.data![index].price}"));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
