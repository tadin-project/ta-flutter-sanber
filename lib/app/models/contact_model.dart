// To parse this JSON data, do
//
//     final ContactModel = ContactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  ContactModel({
    this.nama,
    this.keyNama,
    this.email,
    this.phone,
    this.photoUrl,
    this.registerAt,
    this.userId,
    this.contactId,
  });

  String? nama;
  String? keyNama;
  String? email;
  String? phone;
  String? photoUrl;
  String? registerAt;
  String? userId;
  String? contactId;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        nama: json["nama"],
        keyNama: json["keyNama"],
        email: json["email"],
        phone: json["phone"],
        photoUrl: json["photoUrl"],
        registerAt: json["registerAt"],
        userId: json["userId"],
        contactId: json["contactId"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "keyNama": keyNama,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
        "registerAt": registerAt,
        "userId": userId,
        "contactId": contactId,
      };
}
