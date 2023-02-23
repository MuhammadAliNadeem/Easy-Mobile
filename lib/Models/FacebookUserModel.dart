// To parse this JSON data, do
//
//     final facebookProfileUserModel = facebookProfileUserModelFromJson(jsonString);

import 'dart:convert';

FacebookProfileUserModel facebookProfileUserModelFromJson(String str) => FacebookProfileUserModel.fromJson(json.decode(str));

String facebookProfileUserModelToJson(FacebookProfileUserModel data) => json.encode(data.toJson());

class FacebookProfileUserModel {
    FacebookProfileUserModel({
        required this.id,
        required this.name,
        required this.picture,
    });

    String id;
    String name;
    Picture picture;

    factory FacebookProfileUserModel.fromJson(Map<String, dynamic> json) => FacebookProfileUserModel(
        id: json["id"],
        name: json["name"],
        picture: Picture.fromJson(json["picture"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture.toJson(),
    };
}

class Picture {
    Picture({
        required this.data,
    });

    Data data;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.height,
        required this.isSilhouette,
        required this.url,
        required this.width,
    });

    int height;
    bool isSilhouette;
    String url;
    int width;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        height: json["height"],
        isSilhouette: json["is_silhouette"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "is_silhouette": isSilhouette,
        "url": url,
        "width": width,
    };
}
