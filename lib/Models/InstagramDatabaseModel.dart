import 'dart:collection';

import 'package:flutter/material.dart';

class InstagramDatabaseModel {
  String? imageUrl;
  String? name;
  String? userName;
  String? id;
  String? email;
  int? followers;
  int? followings;
  int? timestamp;
  InstagramDatabaseModel({
    this.imageUrl,
    this.name,
    this.userName,
    this.id,
    this.email,
    this.followers,
    this.followings,
    this.timestamp,
  });
  factory InstagramDatabaseModel.fromJson(Map<String, dynamic> parsedJson) {
    return InstagramDatabaseModel(
      imageUrl: parsedJson["imageUrl"],
      name: parsedJson["name"],
      userName: parsedJson["userName"],
      id: parsedJson["id"],
      email: parsedJson["email"],
      followers: parsedJson["followers"],
      followings: parsedJson["followings"],
      timestamp: parsedJson["timestamp"],
    );
  }
  Map<String, dynamic> instgramToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["imageUrl"] = this.imageUrl;
    map["name"] = this.name;
    map["userName"] = this.userName;
    map["id"] = this.id;
    map["email"] = this.email;
    map["followers"] = this.followers;
    map["followings"] = this.followings;
    map["timestamp"] = this.timestamp;
    return map;
  }
}
