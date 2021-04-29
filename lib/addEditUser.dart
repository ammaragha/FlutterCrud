import 'dart:convert';

import 'package:crud/model/userModel.dart';
import 'package:crud/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htp;

class AddEditUser extends StatefulWidget {
  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String fname, femail, fphone;

  // static const ADD_URL = "http://192.168.1.7/flutterAPI/add.php";
  // Future addUser() async {
  //   return await http.post(Uri.parse(ADD_URL), body: {
  //     'name': 'Ahmed',
  //     'email': 'Ahmed@mail',
  //   });
  // }

  add(UserModel userModel) async {
    await UserService().add(userModel);
    print(userModel.name + "-" + userModel.email + "-" + userModel.phone);
    print(jsonEncode(userModel.toJsonAdd()));
    print('Added succsfully');
  }

// thats it :) lol xD
// wts up open it .. wts ?
// open wts
//  افتخokا
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(hintText: 'Enter Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Name Required ..";
                  } else if (value.length > 20) {
                    return 'Name must be less than 20 char';
                  } else {
                    fname = value;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: 'Enter Email'),
                validator: (value) {
                  if (value.isValidEmail()) {
                    femail = value;
                  } else {
                    return 'Check Email';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                controller: phone,
                decoration: InputDecoration(hintText: 'Enter Phone'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'this field is required';
                  } else if (!isNumeric(value)) {
                    return "phone must be Numbers only";
                  } else if (value.length != 11) {
                    return "phone must be 11 Number ";
                  } else {
                    fphone = value;
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  UserModel userModel =
                      UserModel(name: fname, email: femail, phone: fphone);
                  add(userModel);
                  // Toast.show("name Field is required", context,
                  //     gravity: Toast.CENTER, duration: 2);
                } else {}
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}

//to validate Email
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
