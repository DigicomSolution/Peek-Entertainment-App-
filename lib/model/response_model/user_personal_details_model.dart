// To parse this JSON data, do
//
//     final userPersonalDetailsModel = userPersonalDetailsModelFromJson(jsonString);

import 'dart:convert';

UserPersonalDetailsModel userPersonalDetailsModelFromJson(String str) => UserPersonalDetailsModel.fromJson(json.decode(str));

String userPersonalDetailsModelToJson(UserPersonalDetailsModel data) => json.encode(data.toJson());

class UserPersonalDetailsModel {
  String? firstName;
  String? imageUrl;
  String? lastName;
  DateTime? dateOfBirth;
  String? email;

  UserPersonalDetailsModel({
    this.firstName,
    this.imageUrl,
    this.lastName,
    this.dateOfBirth,
    this.email,
  });

  factory UserPersonalDetailsModel.fromJson(Map<String, dynamic> json) => UserPersonalDetailsModel(
    firstName: json["firstName"],
    imageUrl: json["imageUrl"],
    lastName: json["lastName"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "imageUrl": imageUrl,
    "lastName": lastName,
    "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "email": email,
  };
}
