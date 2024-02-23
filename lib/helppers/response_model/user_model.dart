// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  String? uid;
  String? lName;
  String? fName;
  String? email;

  Usermodel({
    this.uid,
    this.lName,
    this.fName,
    this.email,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        uid: json["uid"],
        lName: json["lName"],
        fName: json["fName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "lName": lName,
        "fName": fName,
        "email": email,
      };
}
