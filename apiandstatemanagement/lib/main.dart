import 'package:apiandstatemanagement/fetchdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apiservice.dart';
import 'model/Products.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ApiProviderr>(
          create: (_) => ApiProviderr()..getDataa()),
    ],
    child: const MyApp(),
  ));
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApiProviderr>(
        builder: (BuildContext context, ApiProviderr value, Widget? child) {
          return ListView.builder(
            itemCount: value.list?.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("${value.list![index].title}"),
              );
            },
          );
        },
      ),
    );
  }
}
