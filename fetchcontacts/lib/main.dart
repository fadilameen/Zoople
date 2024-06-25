// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() {
  runApp(MyApp());
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
  List<Contact> cntct = [];
  bool permissiondenied = false;

  Future<void> getcontacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() {
        permissiondenied = true;
      });
    } else {
      final clist = await FlutterContacts.getContacts();
      setState(() {
        cntct = clist;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getcontacts();
  }

  Widget _body() {
    if (permissiondenied) {
      return Center(
        child: Text("Something Went Wrong"),
      );
    }
    if (cntct.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: cntct.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () async {
            final fullcontact =
                await FlutterContacts.getContact(cntct[index].id);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ContactPage(
                  contact: fullcontact,
                );
              },
            ));
          },
          title: Text(cntct[index].displayName),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final Contact? contact;
  const ContactPage({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact!.displayName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(contact!.displayName),
            Text(contact!.phones.isNotEmpty
                ? contact!.phones.first.number
                : "No phone number available"),
          ],
        ),
      ),
    );
  }
}
