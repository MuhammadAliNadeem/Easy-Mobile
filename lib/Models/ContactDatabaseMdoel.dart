import 'dart:collection';

import 'package:flutter/material.dart';

class ContactDatabaseModel {
  // String? imageUrl;
  String? name;
  String? phoneNo;
  String? id;
  String? email;
  int? timestamp;
  ContactDatabaseModel({
    // this.imageUrl,
    this.name,
    this.phoneNo,
    this.id,
    this.email,
    this.timestamp,
  });
  factory ContactDatabaseModel.fromJson(Map<String, dynamic> parsedJson) {
    return ContactDatabaseModel(
      // imageUrl: parsedJson["imageUrl"],
      name: parsedJson["name"],
      phoneNo: parsedJson["phoneNo"],
      id: parsedJson["id"],
      email: parsedJson["email"],
      timestamp: parsedJson["timestamp"],
    );
  }
  Map<String, dynamic> instgramToMap() {
    Map<String, dynamic> map = HashMap<String, dynamic>();
    // map["imageUrl"] = this.imageUrl;
    map["name"] = this.name;
    map["phoneNo"] = this.phoneNo;
    map["id"] = this.id;
    map["email"] = this.email;
    map["timestamp"] = this.timestamp;
    return map;
  }
}
