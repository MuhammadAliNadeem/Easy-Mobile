import 'dart:collection';

import 'package:flutter/material.dart';

class WhatsappDatabaseModel {
  String? imageUrl;
  String? about;
  String? userName;
  String? id;
  String? email;
  int? timestamp;
  WhatsappDatabaseModel({
    this.imageUrl,
    this.about,
    this.userName,
    this.id,
    this.email,
    this.timestamp,
  });
  factory WhatsappDatabaseModel.fromJson(Map<String, dynamic> parsedJson) {
    return WhatsappDatabaseModel(
      imageUrl: parsedJson["imageUrl"],
      about: parsedJson["name"],
      userName: parsedJson["userName"],
      id: parsedJson["id"],
      email: parsedJson["email"],
      timestamp: parsedJson["timestamp"],
    );
  }
  Map<String, dynamic> instgramToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    map["imageUrl"] = this.imageUrl;
    map["name"] = this.about;
    map["userName"] = this.userName;
    map["id"] = this.id;
    map["email"] = this.email;
    map["timestamp"] = this.timestamp;
    return map;
  }
}
