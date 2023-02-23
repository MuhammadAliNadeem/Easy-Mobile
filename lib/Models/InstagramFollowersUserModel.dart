// To parse this JSON data, do
//
//     final instagramFollowersUserModel = instagramFollowersUserModelFromJson(jsonString);

import 'dart:convert';

InstagramFollowersUserModel instagramFollowersUserModelFromJson(String str) => InstagramFollowersUserModel.fromJson(json.decode(str));

String instagramFollowersUserModelToJson(InstagramFollowersUserModel data) => json.encode(data.toJson());

class InstagramFollowersUserModel {
    InstagramFollowersUserModel({
        required this.count,
        required this.hasMore,
        // required this.endCursor,
        required this.id,
        required this.collector,
    });

    int count;
    bool hasMore;
    // String endCursor;
    String id;
    List<Collector> collector;

    factory InstagramFollowersUserModel.fromJson(Map<String, dynamic> json) => InstagramFollowersUserModel(
        count: json["count"],
        hasMore: json["has_more"],
        // endCursor: json["end_cursor"],
        id: json["id"],
        collector: List<Collector>.from(json["collector"].map((x) => Collector.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "has_more": hasMore,
        // "end_cursor": endCursor,
        "id": id,
        "collector": List<dynamic>.from(collector.map((x) => x.toJson())),
    };
}

class Collector {
    Collector({
        required this.id,
        required this.username,
        required this.fullName,
        required this.profilePicUrl,
        required this.isPrivate,
        required this.isVerified,
    });

    String id;
    String username;
    String fullName;
    String profilePicUrl;
    bool isPrivate;
    bool isVerified;

    factory Collector.fromJson(Map<String, dynamic> json) => Collector(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        profilePicUrl: json["profile_pic_url"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "profile_pic_url": profilePicUrl,
        "is_private": isPrivate,
        "is_verified": isVerified,
    };
}
