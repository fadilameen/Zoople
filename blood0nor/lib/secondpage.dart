import 'package:blood0nor/donor.dart';
import 'package:blood0nor/thirdpage.dart';
import 'package:flutter/material.dart';

import 'dbmanager.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final DatabaseService dbDonorManager = DatabaseService();
  late List<Donor> donorlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donors"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThirdPage(),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: dbDonorManager.getDonorList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            donorlist = snapshot.data as List<Donor>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: donorlist == null ? 0 : donorlist.length,
              itemBuilder: (BuildContext context, int index) {
                Donor dr = donorlist[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Column(
                            children: <Widget>[
                              Text('ID: ${dr.id}'),
                              Text('Name: ${dr.name}'),
                              Text('Age:${dr.age}'),
                              Text('Phone: ${dr.phone}'),
                              Text('Email:${dr.email}'),
                              Text('Blood group:${dr.bloodgroup}')
                            ],
                          ),
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     _nameController.text = dr.name;
                      //     _courseController.text = dr.age;
                      //     student = st;
                      //     updateindex = index;
                      //   },
                      //   icon: const Icon(
                      //     Icons.edit,
                      //     color: Colors.blue,
                      //   ),
                      // ),
                      // IconButton(
                      //   onPressed: () {
                      //     dbDonorManager.deleteStudent(st.id);
                      //     setState(() {
                      //       studlist.removeAt(index);
                      //     });
                      //   },
                      //   icon: Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
