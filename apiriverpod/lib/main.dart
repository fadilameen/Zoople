import 'package:apiriverpod/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/Products.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build Created");
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        body: _data.when(
      data: (List<Products>? _data) {
        List<Products>? productlist = _data;
        return ListView.builder(
          itemCount: productlist!.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("${productlist[index].thumbnail}"),
                ),
                title: Text("${productlist[index].title}"),
                subtitle: Text("${productlist[index].price}"));
          },
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
