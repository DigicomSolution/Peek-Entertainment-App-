import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  String? userName;
  String? imageUrl;
  String? name;

  UserProfileModel({
    this.userName,
    this.imageUrl,
    this.name,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    userName: json["userName"],
    imageUrl: json["imageUrl"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "imageUrl": imageUrl,
    "name": name,
  };
}
