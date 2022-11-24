// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  Userdata({
    required this.username,
    required this.lastseen,
    required this.lastmessage,
    required this.imageurl,
    required this.isgroup,
  });

  String username;
  String lastseen;
  String lastmessage;
  String imageurl;
  bool isgroup;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
      username: json["username"],
      lastseen: json["Lastseen"],
      lastmessage: json["Lastmessage"],
      imageurl: json["imageurl"],
      isgroup: json["isgroup"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "Lastseen": lastseen,
        "Lastmessage": lastmessage,
        "imageurl": imageurl,
        "isgroup": isgroup,
      };
}
