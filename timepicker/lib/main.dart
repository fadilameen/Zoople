import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'GeeksforGeeks';

    return MaterialApp(home: homePage());
  }
}

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final TextEditingController timecontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: timecontroller,
            readOnly: true,
            decoration: InputDecoration(hintText: "select time"),
            onTap: () {
              showtime();
            },
          ),
          TextField(
            controller: datecontroller,
            readOnly: true,
            decoration: InputDecoration(hintText: "select date"),
            onTap: () {
              showcalendar();
            },
          ),
          GestureDetector(
            child: Icon(Icons.date_range),
            onTap: () {
              showcalendar();
            },
          )
        ],
      ),
    );
  }

  Future<void> showtime() async {
    final TimeOfDay? t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      setState(() {
        timecontroller.text = t.format(context);
      });
    }
  }

  Future<void> showcalendar() async {
    final DateTime? d = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      final DateFormat formatter = DateFormat("dd-MM-yyyy");
      final String date = formatter.format(d);
      setState(() {
        datecontroller.text = date;
      });
    }
  }
}
