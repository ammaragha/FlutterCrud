class UserModel {
  String id;
  String name;
  String phone;
  String email;

  UserModel({this.id, this.name, this.email, this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
