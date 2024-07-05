import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
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
  List<String> banners = [
    "https://wallpapers.com/images/high/messi-cool-1o65yy2u5pxy1wok.webp",
    "https://wallpapers.com/images/high/messi-cool-381o1wqe1ge6t6vu.webp",
    "https://wallpapers.com/images/high/messi-cool-b1q0laljzsabqwns.webp",
  ];
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: PageView.builder(
              itemCount: banners.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Container(
                  height: 230,
                  child: Image(image: NetworkImage(banners[index])),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
              controller: controller, // PageController
              count: banners.length,
              effect: WormEffect(), // your preferred effect
              onDotClicked: (index) {}),
          ElevatedButton(
            onPressed: () async {
              SmartDialog.showLoading();
              await Future.delayed(Duration(seconds: 3));
              SmartDialog.dismiss();
              SmartDialog.showToast("loadingg....");
            },
            child: Text("show loading"),
          ),
          ElevatedButton(
            onPressed: () async {
              SmartDialog.show(builder: (context) {
                return Container(
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('easy custom dialog',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              });
              await Future.delayed(Duration(seconds: 3));
              SmartDialog.dismiss();
              SmartDialog.showToast("loadingg....");
            },
            child: Text("show loading"),
          ),
        ],
      )),
    );
  }
}
