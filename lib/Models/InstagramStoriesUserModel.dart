// To parse this JSON data, do
//
//     final instagramStoriesUserModel = instagramStoriesUserModelFromJson(jsonString);

import 'dart:convert';

List<InstagramStoriesUserModel> instagramStoriesUserModelFromJson(String str) => List<InstagramStoriesUserModel>.from(json.decode(str).map((x) => InstagramStoriesUserModel.fromJson(x)));

String instagramStoriesUserModelToJson(List<InstagramStoriesUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstagramStoriesUserModel {
    InstagramStoriesUserModel({
        required this.takenAt,
        required this.pk,
        required this.id,
        required this.deviceTimestamp,
        required this.mediaType,
        required this.code,
        required this.clientCacheKey,
        required this.filterType,
        required this.accessibilityCaption,
        required this.isUnifiedVideo,
        required this.shouldRequestAds,
        required this.originalMediaHasVisualReplyMedia,
        required this.captionIsEdited,
        required this.likeAndViewCountsDisabled,
        required this.commercialityStatus,
        required this.isPaidPartnership,
        required this.isVisualReplyCommenterNoticeEnabled,
        required this.clipsTabPinnedUserIds,
        required this.hasDelayedMetadata,
        required this.captionPosition,
        required this.isReelMedia,
        required this.photoOfYou,
        required this.isOrganicProductTaggingEligible,
        required this.canSeeInsightsAsBrand,
        required this.imageVersions2,
        required this.originalWidth,
        required this.originalHeight,
        this.caption,
        required this.commentInformTreatment,
        required this.sharingFrictionInfo,
        required this.canViewerSave,
        required this.isInProfileGrid,
        required this.profileGridControlEnabled,
        required this.organicTrackingToken,
        required this.expiringAt,
        required this.importedTakenAt,
        required this.hasSharedToFb,
        required this.productType,
        required this.deletedReason,
        required this.integrityReviewDecision,
        this.commerceIntegrityReviewDecision,
        this.musicMetadata,
        required this.isArtistPick,
        required this.user,
        required this.canReshare,
        required this.canReply,
        required this.canSendPrompt,
        required this.isFirstTake,
        required this.isRollcallV2,
        required this.canPlaySpotifyAudio,
        required this.createdFromAddYoursBrowsing,
        required this.storyStaticModels,
        required this.supportsReelReactions,
        required this.canSendCustomEmojis,
        required this.showOneTapFbShareTooltip,
    });

    int takenAt;
    String pk;
    String id;
    int deviceTimestamp;
    int mediaType;
    String code;
    String clientCacheKey;
    int filterType;
    String accessibilityCaption;
    bool isUnifiedVideo;
    bool shouldRequestAds;
    bool originalMediaHasVisualReplyMedia;
    bool captionIsEdited;
    bool likeAndViewCountsDisabled;
    String commercialityStatus;
    bool isPaidPartnership;
    bool isVisualReplyCommenterNoticeEnabled;
    List<dynamic> clipsTabPinnedUserIds;
    bool hasDelayedMetadata;
    int captionPosition;
    bool isReelMedia;
    bool photoOfYou;
    bool isOrganicProductTaggingEligible;
    bool canSeeInsightsAsBrand;
    ImageVersions2 imageVersions2;
    int originalWidth;
    int originalHeight;
    dynamic caption;
    CommentInformTreatment commentInformTreatment;
    SharingFrictionInfo sharingFrictionInfo;
    bool canViewerSave;
    bool isInProfileGrid;
    bool profileGridControlEnabled;
    String organicTrackingToken;
    int expiringAt;
    int importedTakenAt;
    int hasSharedToFb;
    String productType;
    int deletedReason;
    String integrityReviewDecision;
    dynamic commerceIntegrityReviewDecision;
    dynamic musicMetadata;
    bool isArtistPick;
    User user;
    bool canReshare;
    bool canReply;
    bool canSendPrompt;
    bool isFirstTake;
    bool isRollcallV2;
    bool canPlaySpotifyAudio;
    bool createdFromAddYoursBrowsing;
    List<dynamic> storyStaticModels;
    bool supportsReelReactions;
    bool canSendCustomEmojis;
    bool showOneTapFbShareTooltip;

    factory InstagramStoriesUserModel.fromJson(Map<String, dynamic> json) => InstagramStoriesUserModel(
        takenAt: json["taken_at"],
        pk: json["pk"],
        id: json["id"],
        deviceTimestamp: json["device_timestamp"],
        mediaType: json["media_type"],
        code: json["code"],
        clientCacheKey: json["client_cache_key"],
        filterType: json["filter_type"],
        accessibilityCaption: json["accessibility_caption"],
        isUnifiedVideo: json["is_unified_video"],
        shouldRequestAds: json["should_request_ads"],
        originalMediaHasVisualReplyMedia: json["original_media_has_visual_reply_media"],
        captionIsEdited: json["caption_is_edited"],
        likeAndViewCountsDisabled: json["like_and_view_counts_disabled"],
        commercialityStatus: json["commerciality_status"],
        isPaidPartnership: json["is_paid_partnership"],
        isVisualReplyCommenterNoticeEnabled: json["is_visual_reply_commenter_notice_enabled"],
        clipsTabPinnedUserIds: List<dynamic>.from(json["clips_tab_pinned_user_ids"].map((x) => x)),
        hasDelayedMetadata: json["has_delayed_metadata"],
        captionPosition: json["caption_position"],
        isReelMedia: json["is_reel_media"],
        photoOfYou: json["photo_of_you"],
        isOrganicProductTaggingEligible: json["is_organic_product_tagging_eligible"],
        canSeeInsightsAsBrand: json["can_see_insights_as_brand"],
        imageVersions2: ImageVersions2.fromJson(json["image_versions2"]),
        originalWidth: json["original_width"],
        originalHeight: json["original_height"],
        caption: json["caption"],
        commentInformTreatment: CommentInformTreatment.fromJson(json["comment_inform_treatment"]),
        sharingFrictionInfo: SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        canViewerSave: json["can_viewer_save"],
        isInProfileGrid: json["is_in_profile_grid"],
        profileGridControlEnabled: json["profile_grid_control_enabled"],
        organicTrackingToken: json["organic_tracking_token"],
        expiringAt: json["expiring_at"],
        importedTakenAt: json["imported_taken_at"],
        hasSharedToFb: json["has_shared_to_fb"],
        productType: json["product_type"],
        deletedReason: json["deleted_reason"],
        integrityReviewDecision: json["integrity_review_decision"],
        commerceIntegrityReviewDecision: json["commerce_integrity_review_decision"],
        musicMetadata: json["music_metadata"],
        isArtistPick: json["is_artist_pick"],
        user: User.fromJson(json["user"]),
        canReshare: json["can_reshare"],
        canReply: json["can_reply"],
        canSendPrompt: json["can_send_prompt"],
        isFirstTake: json["is_first_take"],
        isRollcallV2: json["is_rollcall_v2"],
        canPlaySpotifyAudio: json["can_play_spotify_audio"],
        createdFromAddYoursBrowsing: json["created_from_add_yours_browsing"],
        storyStaticModels: List<dynamic>.from(json["story_static_models"].map((x) => x)),
        supportsReelReactions: json["supports_reel_reactions"],
        canSendCustomEmojis: json["can_send_custom_emojis"],
        showOneTapFbShareTooltip: json["show_one_tap_fb_share_tooltip"],
    );

    Map<String, dynamic> toJson() => {
        "taken_at": takenAt,
        "pk": pk,
        "id": id,
        "device_timestamp": deviceTimestamp,
        "media_type": mediaType,
        "code": code,
        "client_cache_key": clientCacheKey,
        "filter_type": filterType,
        "accessibility_caption": accessibilityCaption,
        "is_unified_video": isUnifiedVideo,
        "should_request_ads": shouldRequestAds,
        "original_media_has_visual_reply_media": originalMediaHasVisualReplyMedia,
        "caption_is_edited": captionIsEdited,
        "like_and_view_counts_disabled": likeAndViewCountsDisabled,
        "commerciality_status": commercialityStatus,
        "is_paid_partnership": isPaidPartnership,
        "is_visual_reply_commenter_notice_enabled": isVisualReplyCommenterNoticeEnabled,
        "clips_tab_pinned_user_ids": List<dynamic>.from(clipsTabPinnedUserIds.map((x) => x)),
        "has_delayed_metadata": hasDelayedMetadata,
        "caption_position": captionPosition,
        "is_reel_media": isReelMedia,
        "photo_of_you": photoOfYou,
        "is_organic_product_tagging_eligible": isOrganicProductTaggingEligible,
        "can_see_insights_as_brand": canSeeInsightsAsBrand,
        "image_versions2": imageVersions2.toJson(),
        "original_width": originalWidth,
        "original_height": originalHeight,
        "caption": caption,
        "comment_inform_treatment": commentInformTreatment.toJson(),
        "sharing_friction_info": sharingFrictionInfo.toJson(),
        "can_viewer_save": canViewerSave,
        "is_in_profile_grid": isInProfileGrid,
        "profile_grid_control_enabled": profileGridControlEnabled,
        "organic_tracking_token": organicTrackingToken,
        "expiring_at": expiringAt,
        "imported_taken_at": importedTakenAt,
        "has_shared_to_fb": hasSharedToFb,
        "product_type": productType,
        "deleted_reason": deletedReason,
        "integrity_review_decision": integrityReviewDecision,
        "commerce_integrity_review_decision": commerceIntegrityReviewDecision,
        "music_metadata": musicMetadata,
        "is_artist_pick": isArtistPick,
        "user": user.toJson(),
        "can_reshare": canReshare,
        "can_reply": canReply,
        "can_send_prompt": canSendPrompt,
        "is_first_take": isFirstTake,
        "is_rollcall_v2": isRollcallV2,
        "can_play_spotify_audio": canPlaySpotifyAudio,
        "created_from_add_yours_browsing": createdFromAddYoursBrowsing,
        "story_static_models": List<dynamic>.from(storyStaticModels.map((x) => x)),
        "supports_reel_reactions": supportsReelReactions,
        "can_send_custom_emojis": canSendCustomEmojis,
        "show_one_tap_fb_share_tooltip": showOneTapFbShareTooltip,
    };
}

class CommentInformTreatment {
    CommentInformTreatment({
        required this.shouldHaveInformTreatment,
        required this.text,
        this.url,
        this.actionType,
    });

    bool shouldHaveInformTreatment;
    String text;
    dynamic url;
    dynamic actionType;

    factory CommentInformTreatment.fromJson(Map<String, dynamic> json) => CommentInformTreatment(
        shouldHaveInformTreatment: json["should_have_inform_treatment"],
        text: json["text"],
        url: json["url"],
        actionType: json["action_type"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_inform_treatment": shouldHaveInformTreatment,
        "text": text,
        "url": url,
        "action_type": actionType,
    };
}

class ImageVersions2 {
    ImageVersions2({
        required this.candidates,
    });

    List<Candidate> candidates;

    factory ImageVersions2.fromJson(Map<String, dynamic> json) => ImageVersions2(
        candidates: List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "candidates": List<dynamic>.from(candidates.map((x) => x.toJson())),
    };
}

class Candidate {
    Candidate({
        required this.width,
        required this.height,
        required this.url,
    });

    int width;
    int height;
    String url;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        width: json["width"],
        height: json["height"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
    };
}

class SharingFrictionInfo {
    SharingFrictionInfo({
        required this.shouldHaveSharingFriction,
        this.bloksAppUrl,
        this.sharingFrictionPayload,
    });

    bool shouldHaveSharingFriction;
    dynamic bloksAppUrl;
    dynamic sharingFrictionPayload;

    factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) => SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
        sharingFrictionPayload: json["sharing_friction_payload"],
    );

    Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
        "sharing_friction_payload": sharingFrictionPayload,
    };
}

class User {
    User({
        required this.pk,
        required this.isPrivate,
    });

    String pk;
    bool isPrivate;

    factory User.fromJson(Map<String, dynamic> json) => User(
        pk: json["pk"],
        isPrivate: json["is_private"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "is_private": isPrivate,
    };
}
