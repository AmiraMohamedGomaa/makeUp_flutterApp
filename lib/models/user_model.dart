import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.fullName,
    this.lastLoginDate,
    this.signUpDate,
    this.mobile,
  });

  int? id;
  String? email;
  String? fullName;
  DateTime? lastLoginDate;
  DateTime? signUpDate;
  String? mobile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    fullName: json["fullName"],
    lastLoginDate: DateTime.parse(json["lastLoginDate"]),
    signUpDate: DateTime.parse(json["signUpDate"]),
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "fullName": fullName,
    "lastLoginDate": lastLoginDate!.toIso8601String(),
    "signUpDate": signUpDate!.toIso8601String(),
    "mobile": mobile,
  };
}
