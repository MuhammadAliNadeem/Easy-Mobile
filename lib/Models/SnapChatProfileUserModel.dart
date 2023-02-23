// To parse this JSON data, do
//
//     final snapChatProfileUserModel = snapChatProfileUserModelFromJson(jsonString);

import 'dart:convert';

SnapChatProfileUserModel snapChatProfileUserModelFromJson(String str) =>
    SnapChatProfileUserModel.fromJson(json.decode(str));

String snapChatProfileUserModelToJson(SnapChatProfileUserModel data) =>
    json.encode(data.toJson());

class SnapChatProfileUserModel {
  SnapChatProfileUserModel({
    required this.error,
    required this.accountType,
    required this.name,
    required this.snapcodeUrl,
    required this.privateAccountData,
    required this.publicAccountData,
  });

  Error error;
  String accountType;
  String name;
  String snapcodeUrl;
  PrivateAccountData privateAccountData;
  PublicAccountData publicAccountData;

  factory SnapChatProfileUserModel.fromJson(Map<String, dynamic> json) =>
      SnapChatProfileUserModel(
        error: Error.fromJson(json["error"]),
        accountType: json["accountType"],
        name: json["name"]??"",
        snapcodeUrl: json["snapcodeURL"]??"",
        privateAccountData:
            PrivateAccountData.fromJson(json["privateAccountData"]),
        publicAccountData:
            PublicAccountData.fromJson(json["publicAccountData"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
        "accountType": accountType,
        "name": name,
        "snapcodeURL": snapcodeUrl,
        "privateAccountData": privateAccountData.toJson(),
        "publicAccountData": publicAccountData.toJson(),
      };
}

class Error {
  Error({
    required this.isError,
    this.errorMsg,
  });

  bool isError;
  dynamic errorMsg;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        isError: json["isError"],
        errorMsg: json["errorMsg"],
      );

  Map<String, dynamic> toJson() => {
        "isError": isError,
        "errorMsg": errorMsg,
      };
}

class PrivateAccountData {
  PrivateAccountData({
    this.bitmojiUrl,
  });

  dynamic bitmojiUrl;

  factory PrivateAccountData.fromJson(Map<String, dynamic> json) =>
      PrivateAccountData(
        bitmojiUrl: json["bitmojiURL"]??"",
      );

  Map<String, dynamic> toJson() => {
        "bitmojiURL": bitmojiUrl,
      };
}

class PublicAccountData {
  PublicAccountData({required this.profilePictureUrl});

  String profilePictureUrl;

  factory PublicAccountData.fromJson(Map<String, dynamic> json) =>
      PublicAccountData(
        profilePictureUrl: json["profilePictureURL"]??"",
      );

  Map<String, dynamic> toJson() => {
        "profilePictureURL": profilePictureUrl,
      };
}
