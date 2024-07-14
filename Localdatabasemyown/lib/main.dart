import 'package:flutter/material.dart';
import 'package:ldb/dbmanager.dart';
import 'package:ldb/students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  TextEditingController namecontroller = TextEditingController();
  TextEditingController coursecontroller = TextEditingController();
  TextEditingController updatenamecontroller = TextEditingController();
  TextEditingController updatecoursecontroller = TextEditingController();
  final fadilformkey = GlobalKey<FormState>();
  final updateformkey = GlobalKey<FormState>();
  DatabaseService dbStudentManager = DatabaseService();
  Student? student;
  List<Student>? studlist;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Local Database"),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Form(
                  key: fadilformkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field cannot be empty";
                            }
                            return null;
                          },
                          controller: namecontroller,
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field cannot be empty";
                            }
                            return null;
                          },
                          controller: coursecontroller,
                          decoration: InputDecoration(
                            hintText: "Courses",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onSubmit();
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: dbStudentManager.getStudentList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      studlist = snapshot.data as List<Student>;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: studlist!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Student st = studlist![index];
                          return Card(
                            child: ListTile(
                              title: Text(st.name),
                              subtitle: Text(st.course),
                              trailing: SizedBox(
                                width: 64,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          updatenamecontroller.text = st.name;
                                          updatecoursecontroller.text =
                                              st.course;
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: Form(
                                                    key: updateformkey,
                                                    child: Column(
                                                      children: [
                                                        Text(st.id.toString()),
                                                        TextFormField(
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "this field cannot be empty";
                                                            }
                                                            return null;
                                                          },
                                                          controller:
                                                              updatenamecontroller,
                                                        ),
                                                        TextFormField(
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "this field cannot be empty";
                                                            }
                                                            return null;
                                                          },
                                                          controller:
                                                              updatecoursecontroller,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                title: const Text(
                                                    "Student Details"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      if (updateformkey
                                                          .currentState!
                                                          .validate()) {
                                                        dbStudentManager
                                                            .updateStudent(
                                                          Student(
                                                              id: st.id,
                                                              name:
                                                                  updatenamecontroller
                                                                      .text,
                                                              course:
                                                                  updatecoursecontroller
                                                                      .text),
                                                        );
                                                      }
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: const Text("update"),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon:
                                            const Icon(Icons.mode_edit_rounded),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    "Do you really want to delete??"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      dbStudentManager
                                                          .deleteStudent(st);
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: const Text("Delete"),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete_rounded,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("database error"));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    if (fadilformkey.currentState!.validate()) {
      Student st =
          Student(name: namecontroller.text, course: coursecontroller.text);
      dbStudentManager.insertStudent(st).then(
        (value) {
          namecontroller.clear();
          coursecontroller.clear();
        },
      );
    }
    setState(() {});
  }
}
