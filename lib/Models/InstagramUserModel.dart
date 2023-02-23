// To parse this JSON data, do
//
//     final instagramUserModel = instagramUserModelFromJson(jsonString);

import 'dart:convert';

InstagramUserModel instagramUserModelFromJson(String str) =>
    InstagramUserModel.fromJson(json.decode(str));

String instagramUserModelToJson(InstagramUserModel data) =>
    json.encode(data.toJson());

class InstagramUserModel {
  InstagramUserModel({
    // required this.biography,
    // required this.bioLinks,
    // required this.biographyWithEntities,
    // required this.blockedByViewer,
    // required this.restrictedByViewer,
    // required this.countryBlock,
    // this.externalUrl,
    // this.externalUrlLinkshimmed,
    // required this.edgeFollowedBy,
    // required this.fbid,
    // required this.followedByViewer,
    // required this.edgeFollow,
    // required this.followsViewer,
    required this.fullName,
    // this.groupMetadata,
    // required this.hasArEffects,
    // required this.hasClips,
    // required this.hasGuides,
    // required this.hasChannel,
    // required this.hasBlockedViewer,
    // required this.highlightReelCount,
    // required this.hasRequestedViewer,
    // required this.hideLikeAndViewCounts,
    // required this.id,
    // required this.isBusinessAccount,
    // required this.isEligibleToViewAccountTransparency,
    // required this.isProfessionalAccount,
    // required this.isSupervisionEnabled,
    // required this.isGuardianOfViewer,
    // required this.isSupervisedByViewer,
    // required this.isSupervisedUser,
    // required this.isEmbedsDisabled,
    // required this.isJoinedRecently,
    // this.guardianId,
    // this.businessAddressJson,
    // required this.businessContactMethod,
    // this.businessEmail,
    // this.businessPhoneNumber,
    // this.businessCategoryName,
    // this.overallCategoryName,
    // this.categoryEnum,
    // this.categoryName,
    // required this.isPrivate,
    // required this.isVerified,
    // required this.edgeMutualFollowedBy,
    required this.profilePicUrl,
    // required this.message,
    // required this.profilePicUrlHd,
    // required this.requestedByViewer,
    // required this.shouldShowCategory,
    // required this.shouldShowPublicContacts,
    // this.transparencyLabel,
    // required this.transparencyProduct,
    // required this.username,
    // this.connectedFbPage,
    // required this.pronouns,
    // required this.edgeFelixVideoTimeline,
    // required this.edgeOwnerToTimelineMedia,
    // required this.edgeSavedMedia,
    // required this.edgeMediaCollections,
  });

  // String biography;
  // List<dynamic> bioLinks;
  // BiographyWithEntities biographyWithEntities;
  // bool blockedByViewer;
  // bool restrictedByViewer;
  // bool countryBlock;
  // dynamic externalUrl;
  // dynamic externalUrlLinkshimmed;
  // EdgeFollowClass edgeFollowedBy;
  // String fbid;
  // bool followedByViewer;
  // EdgeFollowClass edgeFollow;
  // bool followsViewer;
  String fullName;
  // String message;
  // dynamic groupMetadata;
  // bool hasArEffects;
  // bool hasClips;
  // bool hasGuides;
  // bool hasChannel;
  // bool hasBlockedViewer;
  // int highlightReelCount;
  // bool hasRequestedViewer;
  // bool hideLikeAndViewCounts;
  // String id;
  // bool isBusinessAccount;
  // bool isEligibleToViewAccountTransparency;
  // bool isProfessionalAccount;
  // bool isSupervisionEnabled;
  // bool isGuardianOfViewer;
  // bool isSupervisedByViewer;
  // bool isSupervisedUser;
  // bool isEmbedsDisabled;
  // bool isJoinedRecently;
  // dynamic guardianId;
  // dynamic businessAddressJson;
  // String businessContactMethod;
  // dynamic businessEmail;
  // dynamic businessPhoneNumber;
  // dynamic businessCategoryName;
  // dynamic overallCategoryName;
  // dynamic categoryEnum;
  // dynamic categoryName;
  // bool isPrivate;
  // bool isVerified;
  // EdgeMutualFollowedBy edgeMutualFollowedBy;
  String profilePicUrl;
  // String profilePicUrlHd;
  // bool requestedByViewer;
  // bool shouldShowCategory;
  // bool shouldShowPublicContacts;
  // dynamic transparencyLabel;
  // String transparencyProduct;
  // String username;
  // dynamic connectedFbPage;
  // List<dynamic> pronouns;
  // EdgeFelixVideoTimelineClass edgeFelixVideoTimeline;
  // EdgeFelixVideoTimelineClass edgeOwnerToTimelineMedia;
  // EdgeFelixVideoTimelineClass edgeSavedMedia;
  // EdgeFelixVideoTimelineClass edgeMediaCollections;

  factory InstagramUserModel.fromJson(Map<String, dynamic> json) =>
      InstagramUserModel(
        // message:json["message"]??null,
        // biography: json["biography"],
        // bioLinks: List<dynamic>.from(json["bio_links"].map((x) => x)),
        // biographyWithEntities: BiographyWithEntities.fromJson(json["biography_with_entities"]),
        // blockedByViewer: json["blocked_by_viewer"],
        // restrictedByViewer: json["restricted_by_viewer"],
        // countryBlock: json["country_block"],
        // externalUrl: json["external_url"],
        // externalUrlLinkshimmed: json["external_url_linkshimmed"],
        // edgeFollowedBy: EdgeFollowClass.fromJson(json["edge_followed_by"]),
        // fbid: json["fbid"],
        // followedByViewer: json["followed_by_viewer"],
        // edgeFollow: EdgeFollowClass.fromJson(json["edge_follow"]),
        // followsViewer: json["follows_viewer"],
        fullName: json["full_name"]??"",
        // groupMetadata: json["group_metadata"],
        // hasArEffects: json["has_ar_effects"],
        // hasClips: json["has_clips"],
        // hasGuides: json["has_guides"],
        // hasChannel: json["has_channel"],
        // hasBlockedViewer: json["has_blocked_viewer"],
        // highlightReelCount: json["highlight_reel_count"],
        // hasRequestedViewer: json["has_requested_viewer"],
        // hideLikeAndViewCounts: json["hide_like_and_view_counts"],
        // id: json["id"],
        // isBusinessAccount: json["is_business_account"],
        // isEligibleToViewAccountTransparency: json["is_eligible_to_view_account_transparency"],
        // isProfessionalAccount: json["is_professional_account"],
        // isSupervisionEnabled: json["is_supervision_enabled"],
        // isGuardianOfViewer: json["is_guardian_of_viewer"],
        // isSupervisedByViewer: json["is_supervised_by_viewer"],
        // isSupervisedUser: json["is_supervised_user"],
        // isEmbedsDisabled: json["is_embeds_disabled"],
        // isJoinedRecently: json["is_joined_recently"],
        // guardianId: json["guardian_id"],
        // businessAddressJson: json["business_address_json"],
        // businessContactMethod: json["business_contact_method"],
        // businessEmail: json["business_email"],
        // businessPhoneNumber: json["business_phone_number"],
        // businessCategoryName: json["business_category_name"],
        // overallCategoryName: json["overall_category_name"],
        // categoryEnum: json["category_enum"],
        // categoryName: json["category_name"],
        // isPrivate: json["is_private"],
        // isVerified: json["is_verified"],
        // edgeMutualFollowedBy: EdgeMutualFollowedBy.fromJson(json["edge_mutual_followed_by"]),
        profilePicUrl: json["profile_pic_url"]??"",
        // profilePicUrlHd: json["profile_pic_url_hd"],
        // requestedByViewer: json["requested_by_viewer"],
        // shouldShowCategory: json["should_show_category"],
        // shouldShowPublicContacts: json["should_show_public_contacts"],
        // transparencyLabel: json["transparency_label"],
        // transparencyProduct: json["transparency_product"],
        // username: json["username"],
        // connectedFbPage: json["connected_fb_page"],
        // pronouns: List<dynamic>.from(json["pronouns"].map((x) => x)),
        // edgeFelixVideoTimeline: EdgeFelixVideoTimelineClass.fromJson(json["edge_felix_video_timeline"]),
        // edgeOwnerToTimelineMedia: EdgeFelixVideoTimelineClass.fromJson(json["edge_owner_to_timeline_media"]),
        // edgeSavedMedia: EdgeFelixVideoTimelineClass.fromJson(json["edge_saved_media"]),
        // edgeMediaCollections: EdgeFelixVideoTimelineClass.fromJson(json["edge_media_collections"]),
      );

  Map<String, dynamic> toJson() => {
        // "biography": biography,
        // "bio_links": List<dynamic>.from(bioLinks.map((x) => x)),
        // "biography_with_entities": biographyWithEntities.toJson(),
        // "blocked_by_viewer": blockedByViewer,
        // "restricted_by_viewer": restrictedByViewer,
        // "country_block": countryBlock,
        // "external_url": externalUrl,
        // "external_url_linkshimmed": externalUrlLinkshimmed,
        // "edge_followed_by": edgeFollowedBy.toJson(),
        // "fbid": fbid,
        // "followed_by_viewer": followedByViewer,
        // "edge_follow": edgeFollow.toJson(),
        // "follows_viewer": followsViewer,
        "full_name": fullName,
        // "group_metadata": groupMetadata,
        // "has_ar_effects": hasArEffects,
        // "has_clips": hasClips,
        // "has_guides": hasGuides,
        // "has_channel": hasChannel,
        // "has_blocked_viewer": hasBlockedViewer,
        // "highlight_reel_count": highlightReelCount,
        // "has_requested_viewer": hasRequestedViewer,
        // "hide_like_and_view_counts": hideLikeAndViewCounts,
        // "id": id,
        // "is_business_account": isBusinessAccount,
        // "is_eligible_to_view_account_transparency": isEligibleToViewAccountTransparency,
        // "is_professional_account": isProfessionalAccount,
        // "is_supervision_enabled": isSupervisionEnabled,
        // "is_guardian_of_viewer": isGuardianOfViewer,
        // "is_supervised_by_viewer": isSupervisedByViewer,
        // "is_supervised_user": isSupervisedUser,
        // "is_embeds_disabled": isEmbedsDisabled,
        // "is_joined_recently": isJoinedRecently,
        // "guardian_id": guardianId,
        // "business_address_json": businessAddressJson,
        // "business_contact_method": businessContactMethod,
        // "business_email": businessEmail,
        // "business_phone_number": businessPhoneNumber,
        // "business_category_name": businessCategoryName,
        // "overall_category_name": overallCategoryName,
        // "category_enum": categoryEnum,
        // "category_name": categoryName,
        // "is_private": isPrivate,
        // "is_verified": isVerified,
        // "edge_mutual_followed_by": edgeMutualFollowedBy.toJson(),
        "profile_pic_url": profilePicUrl,
        // "profile_pic_url_hd": profilePicUrlHd,
        // "requested_by_viewer": requestedByViewer,
        // "should_show_category": shouldShowCategory,
        // "should_show_public_contacts": shouldShowPublicContacts,
        // "transparency_label": transparencyLabel,
        // "transparency_product": transparencyProduct,
        // "username": usernameEnumValues.reverse[username],
        // "connected_fb_page": connectedFbPage,
        // "pronouns": List<dynamic>.from(pronouns.map((x) => x)),
        // "edge_felix_video_timeline": edgeFelixVideoTimeline.toJson(),
        // "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia.toJson(),
        // "edge_saved_media": edgeSavedMedia.toJson(),
        // "edge_media_collections": edgeMediaCollections.toJson(),
      };
}

class BiographyWithEntities {
  BiographyWithEntities({
    required this.rawText,
    required this.entities,
  });

  String rawText;
  List<Entity> entities;

  factory BiographyWithEntities.fromJson(Map<String, dynamic> json) =>
      BiographyWithEntities(
        rawText: json["raw_text"],
        entities:
            List<Entity>.from(json["entities"].map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "raw_text": rawText,
        "entities": List<dynamic>.from(entities.map((x) => x.toJson())),
      };
}

class Entity {
  Entity({
    this.user,
    required this.hashtag,
  });

  dynamic user;
  Hashtag hashtag;

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        user: json["user"],
        hashtag: Hashtag.fromJson(json["hashtag"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "hashtag": hashtag.toJson(),
      };
}

class Hashtag {
  Hashtag({
    required this.name,
  });

  String name;

  factory Hashtag.fromJson(Map<String, dynamic> json) => Hashtag(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class EdgeFelixVideoTimelineClass {
  EdgeFelixVideoTimelineClass({
    required this.count,
    required this.pageInfo,
    required this.edges,
  });

  int count;
  PageInfo pageInfo;
  List<EdgeFelixVideoTimelineEdge> edges;

  factory EdgeFelixVideoTimelineClass.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineClass(
        count: json["count"],
        pageInfo: PageInfo.fromJson(json["page_info"]),
        edges: List<EdgeFelixVideoTimelineEdge>.from(
            json["edges"].map((x) => EdgeFelixVideoTimelineEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page_info": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeFelixVideoTimelineEdge {
  EdgeFelixVideoTimelineEdge({
    required this.node,
  });

  PurpleNode node;

  factory EdgeFelixVideoTimelineEdge.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineEdge(
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    required this.typename,
    required this.id,
    required this.shortcode,
    required this.dimensions,
    required this.displayUrl,
    required this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    required this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    this.mediaPreview,
    required this.owner,
    required this.isVideo,
    required this.hasUpcomingEvent,
    this.accessibilityCaption,
    this.dashInfo,
    this.hasAudio,
    this.trackingToken,
    this.videoUrl,
    this.videoViewCount,
    required this.edgeMediaToCaption,
    required this.edgeMediaToComment,
    required this.commentsDisabled,
    required this.takenAtTimestamp,
    required this.edgeLikedBy,
    required this.edgeMediaPreviewLike,
    this.location,
    this.nftAssetInfo,
    required this.thumbnailSrc,
    required this.thumbnailResources,
    this.felixProfileGridCrop,
    required this.coauthorProducers,
    required this.pinnedForUsers,
    required this.viewerCanReshare,
    this.encodingStatus,
    this.isPublished,
    this.productType,
    this.title,
    this.videoDuration,
    this.clipsMusicAttributionInfo,
    this.edgeSidecarToChildren,
  });

  Typename typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeMediaToTaggedUser edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String? mediaPreview;
  Owner owner;
  bool isVideo;
  bool hasUpcomingEvent;
  String? accessibilityCaption;
  DashInfo? dashInfo;
  bool? hasAudio;
  String? trackingToken;
  String? videoUrl;
  int? videoViewCount;
  EdgeMediaTo edgeMediaToCaption;
  EdgeFollowClass edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  Location? location;
  dynamic nftAssetInfo;
  String thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;
  dynamic felixProfileGridCrop;
  List<dynamic> coauthorProducers;
  List<dynamic> pinnedForUsers;
  bool viewerCanReshare;
  dynamic encodingStatus;
  bool? isPublished;
  String? productType;
  String? title;
  double? videoDuration;
  ClipsMusicAttributionInfo? clipsMusicAttributionInfo;
  EdgeSidecarToChildren? edgeSidecarToChildren;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        typename: typenameValues.map[json["__typename"]]!,
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaToTaggedUser.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        hasUpcomingEvent: json["has_upcoming_event"],
        accessibilityCaption: json["accessibility_caption"],
        dashInfo: json["dash_info"] == null
            ? null
            : DashInfo.fromJson(json["dash_info"]),
        hasAudio: json["has_audio"],
        trackingToken: json["tracking_token"],
        videoUrl: json["video_url"],
        videoViewCount: json["video_view_count"],
        edgeMediaToCaption: EdgeMediaTo.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment:
            EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"],
        edgeLikedBy: EdgeFollowClass.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike:
            EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        nftAssetInfo: json["nft_asset_info"],
        thumbnailSrc: json["thumbnail_src"],
        thumbnailResources: List<ThumbnailResource>.from(
            json["thumbnail_resources"]
                .map((x) => ThumbnailResource.fromJson(x))),
        felixProfileGridCrop: json["felix_profile_grid_crop"],
        coauthorProducers:
            List<dynamic>.from(json["coauthor_producers"].map((x) => x)),
        pinnedForUsers:
            List<dynamic>.from(json["pinned_for_users"].map((x) => x)),
        viewerCanReshare: json["viewer_can_reshare"],
        encodingStatus: json["encoding_status"],
        isPublished: json["is_published"],
        productType: json["product_type"],
        title: json["title"],
        videoDuration: json["video_duration"]?.toDouble(),
        clipsMusicAttributionInfo: json["clips_music_attribution_info"] == null
            ? null
            : ClipsMusicAttributionInfo.fromJson(
                json["clips_music_attribution_info"]),
        edgeSidecarToChildren: json["edge_sidecar_to_children"] == null
            ? null
            : EdgeSidecarToChildren.fromJson(json["edge_sidecar_to_children"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "has_upcoming_event": hasUpcomingEvent,
        "accessibility_caption": accessibilityCaption,
        "dash_info": dashInfo?.toJson(),
        "has_audio": hasAudio,
        "tracking_token": trackingToken,
        "video_url": videoUrl,
        "video_view_count": videoViewCount,
        "edge_media_to_caption": edgeMediaToCaption.toJson(),
        "edge_media_to_comment": edgeMediaToComment.toJson(),
        "comments_disabled": commentsDisabled,
        "taken_at_timestamp": takenAtTimestamp,
        "edge_liked_by": edgeLikedBy.toJson(),
        "edge_media_preview_like": edgeMediaPreviewLike.toJson(),
        "location": location?.toJson(),
        "nft_asset_info": nftAssetInfo,
        "thumbnail_src": thumbnailSrc,
        "thumbnail_resources":
            List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
        "felix_profile_grid_crop": felixProfileGridCrop,
        "coauthor_producers":
            List<dynamic>.from(coauthorProducers.map((x) => x)),
        "pinned_for_users": List<dynamic>.from(pinnedForUsers.map((x) => x)),
        "viewer_can_reshare": viewerCanReshare,
        "encoding_status": encodingStatus,
        "is_published": isPublished,
        "product_type": productType,
        "title": title,
        "video_duration": videoDuration,
        "clips_music_attribution_info": clipsMusicAttributionInfo?.toJson(),
        "edge_sidecar_to_children": edgeSidecarToChildren?.toJson(),
      };
}

class ClipsMusicAttributionInfo {
  ClipsMusicAttributionInfo({
    required this.artistName,
    required this.songName,
    required this.usesOriginalAudio,
    required this.shouldMuteAudio,
    required this.shouldMuteAudioReason,
    required this.audioId,
  });

  UsernameEnum artistName;
  String songName;
  bool usesOriginalAudio;
  bool shouldMuteAudio;
  String shouldMuteAudioReason;
  String audioId;

  factory ClipsMusicAttributionInfo.fromJson(Map<String, dynamic> json) =>
      ClipsMusicAttributionInfo(
        artistName: usernameEnumValues.map[json["artist_name"]]!,
        songName: json["song_name"],
        usesOriginalAudio: json["uses_original_audio"],
        shouldMuteAudio: json["should_mute_audio"],
        shouldMuteAudioReason: json["should_mute_audio_reason"],
        audioId: json["audio_id"],
      );

  Map<String, dynamic> toJson() => {
        "artist_name": usernameEnumValues.reverse[artistName],
        "song_name": songName,
        "uses_original_audio": usesOriginalAudio,
        "should_mute_audio": shouldMuteAudio,
        "should_mute_audio_reason": shouldMuteAudioReason,
        "audio_id": audioId,
      };
}

enum UsernameEnum { AWAIS_RAXA }

final usernameEnumValues = EnumValues({"awais_raxa_": UsernameEnum.AWAIS_RAXA});

class DashInfo {
  DashInfo({
    required this.isDashEligible,
    required this.videoDashManifest,
    required this.numberOfQualities,
  });

  bool isDashEligible;
  String videoDashManifest;
  int numberOfQualities;

  factory DashInfo.fromJson(Map<String, dynamic> json) => DashInfo(
        isDashEligible: json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        numberOfQualities: json["number_of_qualities"],
      );

  Map<String, dynamic> toJson() => {
        "is_dash_eligible": isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "number_of_qualities": numberOfQualities,
      };
}

class Dimensions {
  Dimensions({
    required this.height,
    required this.width,
  });

  int height;
  int width;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}

class EdgeFollowClass {
  EdgeFollowClass({
    required this.count,
  });

  int count;

  factory EdgeFollowClass.fromJson(Map<String, dynamic> json) =>
      EdgeFollowClass(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class EdgeMediaTo {
  EdgeMediaTo({
    required this.edges,
  });

  List<EdgeMediaToCaptionEdge> edges;

  factory EdgeMediaTo.fromJson(Map<String, dynamic> json) => EdgeMediaTo(
        edges: List<EdgeMediaToCaptionEdge>.from(
            json["edges"].map((x) => EdgeMediaToCaptionEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeMediaToCaptionEdge {
  EdgeMediaToCaptionEdge({
    required this.node,
  });

  FluffyNode node;

  factory EdgeMediaToCaptionEdge.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToCaptionEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    required this.text,
  });

  String text;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class EdgeMediaToTaggedUser {
  EdgeMediaToTaggedUser({
    required this.edges,
  });

  List<PurpleEdge> edges;

  factory EdgeMediaToTaggedUser.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToTaggedUser(
        edges: List<PurpleEdge>.from(
            json["edges"].map((x) => PurpleEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class PurpleEdge {
  PurpleEdge({
    required this.node,
  });

  TentacledNode node;

  factory PurpleEdge.fromJson(Map<String, dynamic> json) => PurpleEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    required this.user,
    required this.x,
    required this.y,
  });

  User user;
  double x;
  double y;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        user: User.fromJson(json["user"]),
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "x": x,
        "y": y,
      };
}

class User {
  User({
    required this.fullName,
    required this.followedByViewer,
    required this.id,
    required this.isVerified,
    required this.profilePicUrl,
    required this.username,
  });

  String fullName;
  bool followedByViewer;
  String id;
  bool isVerified;
  String profilePicUrl;
  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        followedByViewer: json["followed_by_viewer"],
        id: json["id"],
        isVerified: json["is_verified"],
        profilePicUrl: json["profile_pic_url"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "followed_by_viewer": followedByViewer,
        "id": id,
        "is_verified": isVerified,
        "profile_pic_url": profilePicUrl,
        "username": username,
      };
}

class EdgeSidecarToChildren {
  EdgeSidecarToChildren({
    required this.edges,
  });

  List<EdgeSidecarToChildrenEdge> edges;

  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildren(
        edges: List<EdgeSidecarToChildrenEdge>.from(
            json["edges"].map((x) => EdgeSidecarToChildrenEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeSidecarToChildrenEdge {
  EdgeSidecarToChildrenEdge({
    required this.node,
  });

  StickyNode node;

  factory EdgeSidecarToChildrenEdge.fromJson(Map<String, dynamic> json) =>
      EdgeSidecarToChildrenEdge(
        node: StickyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class StickyNode {
  StickyNode({
    required this.typename,
    required this.id,
    required this.shortcode,
    required this.dimensions,
    required this.displayUrl,
    required this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    required this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    required this.mediaPreview,
    required this.owner,
    required this.isVideo,
    required this.hasUpcomingEvent,
    required this.accessibilityCaption,
  });

  Typename typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeMediaTo edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String mediaPreview;
  Owner owner;
  bool isVideo;
  bool hasUpcomingEvent;
  String accessibilityCaption;

  factory StickyNode.fromJson(Map<String, dynamic> json) => StickyNode(
        typename: typenameValues.map[json["__typename"]]!,
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"],
        edgeMediaToTaggedUser:
            EdgeMediaTo.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo:
            SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        owner: Owner.fromJson(json["owner"]),
        isVideo: json["is_video"],
        hasUpcomingEvent: json["has_upcoming_event"],
        accessibilityCaption: json["accessibility_caption"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typenameValues.reverse[typename],
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "display_url": displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "owner": owner.toJson(),
        "is_video": isVideo,
        "has_upcoming_event": hasUpcomingEvent,
        "accessibility_caption": accessibilityCaption,
      };
}

class Owner {
  Owner({
    required this.id,
    required this.username,
  });

  String id;
  UsernameEnum username;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        username: usernameEnumValues.map[json["username"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameEnumValues.reverse[username],
      };
}

class SharingFrictionInfo {
  SharingFrictionInfo({
    required this.shouldHaveSharingFriction,
    this.bloksAppUrl,
  });

  bool shouldHaveSharingFriction;
  dynamic bloksAppUrl;

  factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) =>
      SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
      );

  Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
      };
}

enum Typename { GRAPH_VIDEO, GRAPH_IMAGE, GRAPH_SIDECAR }

final typenameValues = EnumValues({
  "GraphImage": Typename.GRAPH_IMAGE,
  "GraphSidecar": Typename.GRAPH_SIDECAR,
  "GraphVideo": Typename.GRAPH_VIDEO
});

class Location {
  Location({
    required this.id,
    required this.hasPublicPage,
    required this.name,
    required this.slug,
  });

  String id;
  bool hasPublicPage;
  NameEnum name;
  Slug slug;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        hasPublicPage: json["has_public_page"],
        name: nameEnumValues.map[json["name"]]!,
        slug: slugValues.map[json["slug"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "has_public_page": hasPublicPage,
        "name": nameEnumValues.reverse[name],
        "slug": slugValues.reverse[slug],
      };
}

enum NameEnum { SOMEWHERE_ON_EARTH, UNIVERSITY_OF_LAHORE, LAHORE_PAKISTAN }

final nameEnumValues = EnumValues({
  "Lahore, Pakistan": NameEnum.LAHORE_PAKISTAN,
  "Somewhere on Earth": NameEnum.SOMEWHERE_ON_EARTH,
  "University Of Lahore": NameEnum.UNIVERSITY_OF_LAHORE
});

enum Slug { SOMEWHERE_ON_EARTH, UNIVERSITY_OF_LAHORE, LAHORE_PAKISTAN }

final slugValues = EnumValues({
  "lahore-pakistan": Slug.LAHORE_PAKISTAN,
  "somewhere-on-earth": Slug.SOMEWHERE_ON_EARTH,
  "university-of-lahore": Slug.UNIVERSITY_OF_LAHORE
});

class ThumbnailResource {
  ThumbnailResource({
    required this.src,
    required this.configWidth,
    required this.configHeight,
  });

  String src;
  int configWidth;
  int configHeight;

  factory ThumbnailResource.fromJson(Map<String, dynamic> json) =>
      ThumbnailResource(
        src: json["src"],
        configWidth: json["config_width"],
        configHeight: json["config_height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "config_width": configWidth,
        "config_height": configHeight,
      };
}

class PageInfo {
  PageInfo({
    required this.hasNextPage,
    this.endCursor,
  });

  bool hasNextPage;
  String? endCursor;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["has_next_page"],
        endCursor: json["end_cursor"],
      );

  Map<String, dynamic> toJson() => {
        "has_next_page": hasNextPage,
        "end_cursor": endCursor,
      };
}

class EdgeMutualFollowedBy {
  EdgeMutualFollowedBy({
    required this.count,
    required this.edges,
  });

  int count;
  List<dynamic> edges;

  factory EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) =>
      EdgeMutualFollowedBy(
        count: json["count"],
        edges: List<dynamic>.from(json["edges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "edges": List<dynamic>.from(edges.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
