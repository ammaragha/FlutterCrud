import 'dart:convert';
import 'dart:io';

import 'package:crud/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const ADD_URL = "http://192.168.1.164/flutterAPI/add.php";
  static const GET_URL = "http://192.168.1.164/flutterAPI/get.php";

  Future addUser(UserModel userModel) async {
    return await http.post(Uri.parse(ADD_URL), body: userModel.toJsonAdd());
  }

  Future<String> add(UserModel userModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: userModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  List<UserModel> userFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  }

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(GET_URL));
    print(response.body);
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      return List<UserModel>();
    }
  }
}
