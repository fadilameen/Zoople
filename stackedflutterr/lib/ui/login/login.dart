import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedflutterr/ui/login/loginviewmodel.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Loginviewmodel>.reactive(
      onViewModelReady: (model) {
        model.fetchdata();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              TextField(
                controller: model.controller1,
              ),
              ElevatedButton(
                onPressed: () {
                  model.printdata();
                },
                child: Text("print"),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () {
        return Loginviewmodel();
      },
    );
  }
}
