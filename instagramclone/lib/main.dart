import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> names = [
    "fadil",
    "thameem",
    "ameen",
    "nihal",
    "leo",
    "ansef",
    "sui",
    "cristi",
    "aish",
    "chech",
    "meeehhsi",
  ];

  final List<String> imageUrls = [
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
  // int currentindex = 0;
  // List<Widget> pages = [HomePage(), explore(), add(), reels(), myprofile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.messenger_outline_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcK3oFFNgcvYOCcGLOeB7JCquJgoHoa4JDtw&usqp=CAU"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Your Story",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          names.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      NetworkImage(imageUrls[index]),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  names[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 5,
                                top: 5,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage:
                                      NetworkImage(imageUrls[index]),
                                ),
                              ),
                              Positioned(
                                left: 45,
                                top: 10,
                                child: Text(
                                  names[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 1,
                                bottom: 40,
                                right: 1,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageUrls[index]),
                                ),
                              ),
                              Positioned(
                                bottom: .5,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 23,
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 23,
                                        Icons.messenger_outline_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 23,
                                        Icons.rocket_launch_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
//
// class explore extends StatelessWidget {
//   const explore({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
//
// class add extends StatelessWidget {
//   const add({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
//
// class reels extends StatelessWidget {
//   const reels({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
//
// class myprofile extends StatelessWidget {
//   const myprofile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Placeholder(),
//     );
//   }
// }
