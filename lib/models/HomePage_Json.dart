// To parse this JSON data, do
//
//     final jsonData = jsonDataFromJson(jsonString);

import 'dart:convert';

JsonData jsonDataFromJson(String str) => JsonData.fromJson(json.decode(str));

String jsonDataToJson(JsonData data) => json.encode(data.toJson());

class JsonData {
  JsonData({
    this.user,
    this.upperFeed,
    this.myList,
  });

  User user;
  List<MyList> upperFeed;
  List<MyList> myList;

  factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
        user: User.fromJson(json["user"]),
        upperFeed:
            List<MyList>.from(json["upperFeed"].map((x) => MyList.fromJson(x))),
        myList:
            List<MyList>.from(json["myList"].map((x) => MyList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "upperFeed": List<dynamic>.from(upperFeed.map((x) => x.toJson())),
        "myList": List<dynamic>.from(myList.map((x) => x.toJson())),
      };
}

class MyList {
  MyList({
    this.id,
    this.type,
    this.link,
    this.imgUrl,
    this.title,
    this.readTimeMinutes,
    this.text,
  });

  int id;
  String type;
  String link;
  String imgUrl;
  String title;
  int readTimeMinutes;
  String text;

  factory MyList.fromJson(Map<String, dynamic> json) => MyList(
        id: json["id"],
        type: json["type"],
        link: json["link"],
        imgUrl: json["imgUrl"],
        title: json["title"],
        readTimeMinutes: json["readTimeMinutes"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "link": link,
        "imgUrl": imgUrl,
        "title": title,
        "readTimeMinutes": readTimeMinutes,
        "text": text,
      };
}

class User {
  User({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
