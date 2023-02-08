// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.nama,
    this.email,
    this.phone,
    this.photoUrl,
    this.registerAt,
  });

  String? nama;
  String? email;
  String? phone;
  String? photoUrl;
  String? registerAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        email: json["email"],
        phone: json["phone"],
        photoUrl: json["photoUrl"],
        registerAt: json["registerAt"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
        "registerAt": registerAt,
      };
}
