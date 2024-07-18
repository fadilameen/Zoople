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
          body: Form(
            key: model
                .formKey, // Declare _formKey as a GlobalKey<FormState> in your State class

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: model.namecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: model.phonecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Add additional validation logic for phone number if needed
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: model.emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      }
                      // Add additional validation logic for email if needed
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: model.agecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      // Add additional validation logic for age if needed
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (model.formKey.currentState!.validate()) {
                      model.validate();
                    }
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () {
        return Loginviewmodel();
      },
    );
  }
}
