import 'package:crud/addEditUser.dart';
import 'package:crud/service/userService.dart';
import 'package:flutter/material.dart';

import 'model/userModel.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> userList;
  bool loading = true;

  getall() async {
    userList = await UserService().getUser();
    setState(() {
      loading = false;
    });
    print('Users: ${userList.length}');
  }

  @override
  void initState() {
    // TODO: implement initState
    getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Data'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddEditUser()))
                    .then((value) => getall());
              })
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];
                return Card(
                  child: ListTile(
                    title: Text(" ${user.name} - ${user.phone}"),
                    subtitle: Text(user.email),
                  ),
                );
              }),
    );
  }
}
