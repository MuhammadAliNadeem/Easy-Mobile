import 'dart:collection';

import 'package:flutter/material.dart';

class SnapChatDatabaseModel {
  String? imageUrl;
  String? name;
  String? userName;
  String? id;
  String? email;
  int? timestamp;
  SnapChatDatabaseModel({
    this.imageUrl,
    this.name,
    this.userName,
    this.id,
    this.email,
    this.timestamp,
  });
  factory SnapChatDatabaseModel.fromJson(Map<String, dynamic> parsedJson) {
    return SnapChatDatabaseModel(
      imageUrl: parsedJson["imageUrl"],
      name: parsedJson["name"],
      userName: parsedJson["userName"],
      id: parsedJson["id"],
      email: parsedJson["email"],
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
    map["timestamp"] = this.timestamp;
    return map;
  }
}
