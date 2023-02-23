// To parse this JSON data, do
//
//     final instagramReelsUserModel = instagramReelsUserModelFromJson(jsonString);

import 'dart:convert';

InstagramReelsUserModel instagramReelsUserModelFromJson(String str) =>
    InstagramReelsUserModel.fromJson(json.decode(str));

class InstagramReelsUserModel {
  InstagramReelsUserModel({
    required this.items,
  });

  List<Item> items;

  factory InstagramReelsUserModel.fromJson(Map<String, dynamic> json) =>
      InstagramReelsUserModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );


}

class Item {
  Item({
    required this.videoVersions,
  });

  List<VideoVersion> videoVersions;
  factory Item.fromJson(Map<String, dynamic> json) => Item(
        videoVersions: List<VideoVersion>.from(
            json["video_versions"].map((x) => VideoVersion.fromJson(x))),
      );

}

class Caption {
  Caption({
    required this.pk,
    required this.userId,
    required this.text,
    required this.type,
    required this.createdAt,
    required this.createdAtUtc,
    required this.contentType,
    required this.status,
    required this.bitFlags,
    required this.didReportAsSpam,
    required this.shareEnabled,
    required this.user,
    required this.isCovered,
    required this.isRankedComment,
    required this.mediaId,
    required this.privateReplyStatus,
  });

  String pk;
  String userId;
  String text;
  int type;
  int createdAt;
  int createdAtUtc;
  ContentType contentType;
  Status status;
  int bitFlags;
  bool didReportAsSpam;
  bool shareEnabled;
  IgArtistClass user;
  bool isCovered;
  bool isRankedComment;
  String mediaId;
  int privateReplyStatus;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        pk: json["pk"],
        userId: json["user_id"],
        text: json["text"],
        type: json["type"],
        createdAt: json["created_at"],
        createdAtUtc: json["created_at_utc"],
        contentType: contentTypeValues.map[json["content_type"]]!,
        status: statusValues.map[json["status"]]!,
        bitFlags: json["bit_flags"],
        didReportAsSpam: json["did_report_as_spam"],
        shareEnabled: json["share_enabled"],
        user: IgArtistClass.fromJson(json["user"]),
        isCovered: json["is_covered"],
        isRankedComment: json["is_ranked_comment"],
        mediaId: json["media_id"],
        privateReplyStatus: json["private_reply_status"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "user_id": userId,
        "text": text,
        "type": type,
        "created_at": createdAt,
        "created_at_utc": createdAtUtc,
        "content_type": contentTypeValues.reverse[contentType],
        "status": statusValues.reverse[status],
        "bit_flags": bitFlags,
        "did_report_as_spam": didReportAsSpam,
        "share_enabled": shareEnabled,
        "user": user.toJson(),
        "is_covered": isCovered,
        "is_ranked_comment": isRankedComment,
        "media_id": mediaId,
        "private_reply_status": privateReplyStatus,
      };
}

enum ContentType { COMMENT }

final contentTypeValues = EnumValues({"comment": ContentType.COMMENT});

enum Status { ACTIVE }

final statusValues = EnumValues({"Active": Status.ACTIVE});

class IgArtistClass {
  IgArtistClass({
    required this.pk,
    required this.pkId,
    required this.username,
    required this.fullName,
    required this.isPrivate,
    required this.isVerified,
    required this.profilePicId,
    required this.profilePicUrl,
    this.fbidV2,
  });

  String pk;
  String pkId;
  String username;
  String fullName;
  bool isPrivate;
  bool isVerified;
  String profilePicId;
  String profilePicUrl;
  String? fbidV2;

  factory IgArtistClass.fromJson(Map<String, dynamic> json) => IgArtistClass(
        pk: json["pk"],
        pkId: json["pk_id"],
        username: json["username"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        profilePicId: json["profile_pic_id"],
        profilePicUrl: json["profile_pic_url"],
        fbidV2: json["fbid_v2"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "pk_id": pkId,
        "username": username,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "profile_pic_id": profilePicId,
        "profile_pic_url": profilePicUrl,
        "fbid_v2": fbidV2,
      };
}

class ClipsMetadata {
  ClipsMetadata({
    this.musicInfo,
    this.originalSoundInfo,
    required this.audioType,
    required this.musicCanonicalId,
    this.featuredLabel,
    required this.mashupInfo,
    this.nuxInfo,
    this.viewerInteractionSettings,
    required this.brandedContentTagInfo,
    this.shoppingInfo,
    required this.additionalAudioInfo,
    required this.isSharedToFb,
    this.breakingContentInfo,
    this.challengeInfo,
    this.reelsOnTheRiseInfo,
    this.breakingCreatorInfo,
    this.assetRecommendationInfo,
    this.contextualHighlightInfo,
    required this.clipsCreationEntryPoint,
    required this.audioRankingInfo,
    this.templateInfo,
    this.isFanClubPromoVideo,
    required this.disableUseInClipsClientCache,
    required this.contentAppreciationInfo,
    required this.achievementsInfo,
    required this.showAchievements,
    required this.showTips,
    this.merchandisingPillInfo,
    required this.isPublicChatWelcomeVideo,
    required this.professionalClipsUpsellType,
  });

  MusicInfo? musicInfo;
  OriginalSoundInfo? originalSoundInfo;
  AudioType audioType;
  String musicCanonicalId;
  dynamic featuredLabel;
  MashupInfo mashupInfo;
  dynamic nuxInfo;
  dynamic viewerInteractionSettings;
  BrandedContentTagInfo brandedContentTagInfo;
  dynamic shoppingInfo;
  AdditionalAudioInfo additionalAudioInfo;
  bool isSharedToFb;
  dynamic breakingContentInfo;
  dynamic challengeInfo;
  dynamic reelsOnTheRiseInfo;
  dynamic breakingCreatorInfo;
  dynamic assetRecommendationInfo;
  dynamic contextualHighlightInfo;
  ProductType clipsCreationEntryPoint;
  AudioRankingInfo audioRankingInfo;
  dynamic templateInfo;
  dynamic isFanClubPromoVideo;
  bool disableUseInClipsClientCache;
  ContentAppreciationInfo contentAppreciationInfo;
  AchievementsInfo achievementsInfo;
  bool showAchievements;
  bool showTips;
  dynamic merchandisingPillInfo;
  bool isPublicChatWelcomeVideo;
  int professionalClipsUpsellType;

  factory ClipsMetadata.fromJson(Map<String, dynamic> json) => ClipsMetadata(
        musicInfo: json["music_info"] == null
            ? null
            : MusicInfo.fromJson(json["music_info"]),
        originalSoundInfo: json["original_sound_info"] == null
            ? null
            : OriginalSoundInfo.fromJson(json["original_sound_info"]),
        audioType: audioTypeValues.map[json["audio_type"]]!,
        musicCanonicalId: json["music_canonical_id"],
        featuredLabel: json["featured_label"],
        mashupInfo: MashupInfo.fromJson(json["mashup_info"]),
        nuxInfo: json["nux_info"],
        viewerInteractionSettings: json["viewer_interaction_settings"],
        brandedContentTagInfo:
            BrandedContentTagInfo.fromJson(json["branded_content_tag_info"]),
        shoppingInfo: json["shopping_info"],
        additionalAudioInfo:
            AdditionalAudioInfo.fromJson(json["additional_audio_info"]),
        isSharedToFb: json["is_shared_to_fb"],
        breakingContentInfo: json["breaking_content_info"],
        challengeInfo: json["challenge_info"],
        reelsOnTheRiseInfo: json["reels_on_the_rise_info"],
        breakingCreatorInfo: json["breaking_creator_info"],
        assetRecommendationInfo: json["asset_recommendation_info"],
        contextualHighlightInfo: json["contextual_highlight_info"],
        clipsCreationEntryPoint:
            productTypeValues.map[json["clips_creation_entry_point"]]!,
        audioRankingInfo: AudioRankingInfo.fromJson(json["audio_ranking_info"]),
        templateInfo: json["template_info"],
        isFanClubPromoVideo: json["is_fan_club_promo_video"],
        disableUseInClipsClientCache: json["disable_use_in_clips_client_cache"],
        contentAppreciationInfo:
            ContentAppreciationInfo.fromJson(json["content_appreciation_info"]),
        achievementsInfo: AchievementsInfo.fromJson(json["achievements_info"]),
        showAchievements: json["show_achievements"],
        showTips: json["show_tips"],
        merchandisingPillInfo: json["merchandising_pill_info"],
        isPublicChatWelcomeVideo: json["is_public_chat_welcome_video"],
        professionalClipsUpsellType: json["professional_clips_upsell_type"],
      );

  Map<String, dynamic> toJson() => {
        "music_info": musicInfo?.toJson(),
        "original_sound_info": originalSoundInfo?.toJson(),
        "audio_type": audioTypeValues.reverse[audioType],
        "music_canonical_id": musicCanonicalId,
        "featured_label": featuredLabel,
        "mashup_info": mashupInfo.toJson(),
        "nux_info": nuxInfo,
        "viewer_interaction_settings": viewerInteractionSettings,
        "branded_content_tag_info": brandedContentTagInfo.toJson(),
        "shopping_info": shoppingInfo,
        "additional_audio_info": additionalAudioInfo.toJson(),
        "is_shared_to_fb": isSharedToFb,
        "breaking_content_info": breakingContentInfo,
        "challenge_info": challengeInfo,
        "reels_on_the_rise_info": reelsOnTheRiseInfo,
        "breaking_creator_info": breakingCreatorInfo,
        "asset_recommendation_info": assetRecommendationInfo,
        "contextual_highlight_info": contextualHighlightInfo,
        "clips_creation_entry_point":
            productTypeValues.reverse[clipsCreationEntryPoint],
        "audio_ranking_info": audioRankingInfo.toJson(),
        "template_info": templateInfo,
        "is_fan_club_promo_video": isFanClubPromoVideo,
        "disable_use_in_clips_client_cache": disableUseInClipsClientCache,
        "content_appreciation_info": contentAppreciationInfo.toJson(),
        "achievements_info": achievementsInfo.toJson(),
        "show_achievements": showAchievements,
        "show_tips": showTips,
        "merchandising_pill_info": merchandisingPillInfo,
        "is_public_chat_welcome_video": isPublicChatWelcomeVideo,
        "professional_clips_upsell_type": professionalClipsUpsellType,
      };
}

class AchievementsInfo {
  AchievementsInfo({
    required this.showAchievements,
    this.numEarnedAchievements,
  });

  bool showAchievements;
  dynamic numEarnedAchievements;

  factory AchievementsInfo.fromJson(Map<String, dynamic> json) =>
      AchievementsInfo(
        showAchievements: json["show_achievements"],
        numEarnedAchievements: json["num_earned_achievements"],
      );

  Map<String, dynamic> toJson() => {
        "show_achievements": showAchievements,
        "num_earned_achievements": numEarnedAchievements,
      };
}

class AdditionalAudioInfo {
  AdditionalAudioInfo({
    this.additionalAudioUsername,
    required this.audioReattributionInfo,
  });

  dynamic additionalAudioUsername;
  AudioReattributionInfo audioReattributionInfo;

  factory AdditionalAudioInfo.fromJson(Map<String, dynamic> json) =>
      AdditionalAudioInfo(
        additionalAudioUsername: json["additional_audio_username"],
        audioReattributionInfo:
            AudioReattributionInfo.fromJson(json["audio_reattribution_info"]),
      );

  Map<String, dynamic> toJson() => {
        "additional_audio_username": additionalAudioUsername,
        "audio_reattribution_info": audioReattributionInfo.toJson(),
      };
}

class AudioReattributionInfo {
  AudioReattributionInfo({
    required this.shouldAllowRestore,
  });

  bool shouldAllowRestore;

  factory AudioReattributionInfo.fromJson(Map<String, dynamic> json) =>
      AudioReattributionInfo(
        shouldAllowRestore: json["should_allow_restore"],
      );

  Map<String, dynamic> toJson() => {
        "should_allow_restore": shouldAllowRestore,
      };
}

class AudioRankingInfo {
  AudioRankingInfo({
    required this.bestAudioClusterId,
  });

  String bestAudioClusterId;

  factory AudioRankingInfo.fromJson(Map<String, dynamic> json) =>
      AudioRankingInfo(
        bestAudioClusterId: json["best_audio_cluster_id"],
      );

  Map<String, dynamic> toJson() => {
        "best_audio_cluster_id": bestAudioClusterId,
      };
}

enum AudioType { LICENSED_MUSIC, ORIGINAL_SOUNDS }

final audioTypeValues = EnumValues({
  "licensed_music": AudioType.LICENSED_MUSIC,
  "original_sounds": AudioType.ORIGINAL_SOUNDS
});

class BrandedContentTagInfo {
  BrandedContentTagInfo({
    required this.canAddTag,
  });

  bool canAddTag;

  factory BrandedContentTagInfo.fromJson(Map<String, dynamic> json) =>
      BrandedContentTagInfo(
        canAddTag: json["can_add_tag"],
      );

  Map<String, dynamic> toJson() => {
        "can_add_tag": canAddTag,
      };
}

enum ProductType { CLIPS, FEED }

final productTypeValues =
    EnumValues({"clips": ProductType.CLIPS, "feed": ProductType.FEED});

class ContentAppreciationInfo {
  ContentAppreciationInfo({
    required this.enabled,
  });

  bool enabled;

  factory ContentAppreciationInfo.fromJson(Map<String, dynamic> json) =>
      ContentAppreciationInfo(
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
      };
}

class MashupInfo {
  MashupInfo({
    required this.mashupsAllowed,
    required this.canToggleMashupsAllowed,
    required this.hasBeenMashedUp,
    this.formattedMashupsCount,
    this.originalMedia,
    this.privacyFilteredMashupsMediaCount,
    this.nonPrivacyFilteredMashupsMediaCount,
    this.mashupType,
    required this.isCreatorRequestingMashup,
    required this.hasNonmimicableAdditionalAudio,
  });

  bool mashupsAllowed;
  bool canToggleMashupsAllowed;
  bool hasBeenMashedUp;
  dynamic formattedMashupsCount;
  dynamic originalMedia;
  dynamic privacyFilteredMashupsMediaCount;
  dynamic nonPrivacyFilteredMashupsMediaCount;
  dynamic mashupType;
  bool isCreatorRequestingMashup;
  bool hasNonmimicableAdditionalAudio;

  factory MashupInfo.fromJson(Map<String, dynamic> json) => MashupInfo(
        mashupsAllowed: json["mashups_allowed"],
        canToggleMashupsAllowed: json["can_toggle_mashups_allowed"],
        hasBeenMashedUp: json["has_been_mashed_up"],
        formattedMashupsCount: json["formatted_mashups_count"],
        originalMedia: json["original_media"],
        privacyFilteredMashupsMediaCount:
            json["privacy_filtered_mashups_media_count"],
        nonPrivacyFilteredMashupsMediaCount:
            json["non_privacy_filtered_mashups_media_count"],
        mashupType: json["mashup_type"],
        isCreatorRequestingMashup: json["is_creator_requesting_mashup"],
        hasNonmimicableAdditionalAudio:
            json["has_nonmimicable_additional_audio"],
      );

  Map<String, dynamic> toJson() => {
        "mashups_allowed": mashupsAllowed,
        "can_toggle_mashups_allowed": canToggleMashupsAllowed,
        "has_been_mashed_up": hasBeenMashedUp,
        "formatted_mashups_count": formattedMashupsCount,
        "original_media": originalMedia,
        "privacy_filtered_mashups_media_count":
            privacyFilteredMashupsMediaCount,
        "non_privacy_filtered_mashups_media_count":
            nonPrivacyFilteredMashupsMediaCount,
        "mashup_type": mashupType,
        "is_creator_requesting_mashup": isCreatorRequestingMashup,
        "has_nonmimicable_additional_audio": hasNonmimicableAdditionalAudio,
      };
}

class MusicInfo {
  MusicInfo({
    required this.musicAssetInfo,
    required this.musicConsumptionInfo,
    this.musicCanonicalId,
  });

  MusicAssetInfo musicAssetInfo;
  MusicConsumptionInfo musicConsumptionInfo;
  dynamic musicCanonicalId;

  factory MusicInfo.fromJson(Map<String, dynamic> json) => MusicInfo(
        musicAssetInfo: MusicAssetInfo.fromJson(json["music_asset_info"]),
        musicConsumptionInfo:
            MusicConsumptionInfo.fromJson(json["music_consumption_info"]),
        musicCanonicalId: json["music_canonical_id"],
      );

  Map<String, dynamic> toJson() => {
        "music_asset_info": musicAssetInfo.toJson(),
        "music_consumption_info": musicConsumptionInfo.toJson(),
        "music_canonical_id": musicCanonicalId,
      };
}

class MusicAssetInfo {
  MusicAssetInfo({
    required this.audioClusterId,
    required this.id,
    required this.title,
    this.sanitizedTitle,
    required this.subtitle,
    required this.displayArtist,
    required this.artistId,
    required this.coverArtworkUri,
    required this.coverArtworkThumbnailUri,
    required this.progressiveDownloadUrl,
    this.reactiveAudioDownloadUrl,
    required this.fastStartProgressiveDownloadUrl,
    required this.web30SPreviewDownloadUrl,
    required this.highlightStartTimesInMs,
    required this.isExplicit,
    this.dashManifest,
    required this.hasLyrics,
    required this.audioAssetId,
    required this.durationInMs,
    this.darkMessage,
    required this.allowsSaving,
    required this.territoryValidityPeriods,
    this.igUsername,
  });

  String audioClusterId;
  String id;
  String title;
  dynamic sanitizedTitle;
  String subtitle;
  String displayArtist;
  String artistId;
  String coverArtworkUri;
  String coverArtworkThumbnailUri;
  String progressiveDownloadUrl;
  dynamic reactiveAudioDownloadUrl;
  String fastStartProgressiveDownloadUrl;
  String web30SPreviewDownloadUrl;
  List<int> highlightStartTimesInMs;
  bool isExplicit;
  dynamic dashManifest;
  bool hasLyrics;
  String audioAssetId;
  int durationInMs;
  dynamic darkMessage;
  bool allowsSaving;
  TerritoryValidityPeriods territoryValidityPeriods;
  String? igUsername;

  factory MusicAssetInfo.fromJson(Map<String, dynamic> json) => MusicAssetInfo(
        audioClusterId: json["audio_cluster_id"],
        id: json["id"],
        title: json["title"],
        sanitizedTitle: json["sanitized_title"],
        subtitle: json["subtitle"],
        displayArtist: json["display_artist"],
        artistId: json["artist_id"],
        coverArtworkUri: json["cover_artwork_uri"],
        coverArtworkThumbnailUri: json["cover_artwork_thumbnail_uri"],
        progressiveDownloadUrl: json["progressive_download_url"],
        reactiveAudioDownloadUrl: json["reactive_audio_download_url"],
        fastStartProgressiveDownloadUrl:
            json["fast_start_progressive_download_url"],
        web30SPreviewDownloadUrl: json["web_30s_preview_download_url"],
        highlightStartTimesInMs:
            List<int>.from(json["highlight_start_times_in_ms"].map((x) => x)),
        isExplicit: json["is_explicit"],
        dashManifest: json["dash_manifest"],
        hasLyrics: json["has_lyrics"],
        audioAssetId: json["audio_asset_id"],
        durationInMs: json["duration_in_ms"],
        darkMessage: json["dark_message"],
        allowsSaving: json["allows_saving"],
        territoryValidityPeriods: TerritoryValidityPeriods.fromJson(
            json["territory_validity_periods"]),
        igUsername: json["ig_username"],
      );

  Map<String, dynamic> toJson() => {
        "audio_cluster_id": audioClusterId,
        "id": id,
        "title": title,
        "sanitized_title": sanitizedTitle,
        "subtitle": subtitle,
        "display_artist": displayArtist,
        "artist_id": artistId,
        "cover_artwork_uri": coverArtworkUri,
        "cover_artwork_thumbnail_uri": coverArtworkThumbnailUri,
        "progressive_download_url": progressiveDownloadUrl,
        "reactive_audio_download_url": reactiveAudioDownloadUrl,
        "fast_start_progressive_download_url": fastStartProgressiveDownloadUrl,
        "web_30s_preview_download_url": web30SPreviewDownloadUrl,
        "highlight_start_times_in_ms":
            List<dynamic>.from(highlightStartTimesInMs.map((x) => x)),
        "is_explicit": isExplicit,
        "dash_manifest": dashManifest,
        "has_lyrics": hasLyrics,
        "audio_asset_id": audioAssetId,
        "duration_in_ms": durationInMs,
        "dark_message": darkMessage,
        "allows_saving": allowsSaving,
        "territory_validity_periods": territoryValidityPeriods.toJson(),
        "ig_username": igUsername,
      };
}

class TerritoryValidityPeriods {
  TerritoryValidityPeriods();

  factory TerritoryValidityPeriods.fromJson(Map<String, dynamic> json) =>
      TerritoryValidityPeriods();

  Map<String, dynamic> toJson() => {};
}

class MusicConsumptionInfo {
  MusicConsumptionInfo({
    this.igArtist,
    required this.placeholderProfilePicUrl,
    required this.shouldMuteAudio,
    required this.shouldMuteAudioReason,
    this.shouldMuteAudioReasonType,
    required this.isBookmarked,
    required this.overlapDurationInMs,
    required this.audioAssetStartTimeInMs,
    required this.allowMediaCreationWithMusic,
    required this.isTrendingInClips,
    this.formattedClipsMediaCount,
    this.streamingServices,
    this.displayLabels,
    required this.shouldAllowMusicEditing,
  });

  IgArtistClass? igArtist;
  String placeholderProfilePicUrl;
  bool shouldMuteAudio;
  ShouldMuteAudioReason shouldMuteAudioReason;
  dynamic shouldMuteAudioReasonType;
  bool isBookmarked;
  int overlapDurationInMs;
  int audioAssetStartTimeInMs;
  bool allowMediaCreationWithMusic;
  bool isTrendingInClips;
  dynamic formattedClipsMediaCount;
  dynamic streamingServices;
  dynamic displayLabels;
  bool shouldAllowMusicEditing;

  factory MusicConsumptionInfo.fromJson(Map<String, dynamic> json) =>
      MusicConsumptionInfo(
        igArtist: json["ig_artist"] == null
            ? null
            : IgArtistClass.fromJson(json["ig_artist"]),
        placeholderProfilePicUrl: json["placeholder_profile_pic_url"],
        shouldMuteAudio: json["should_mute_audio"],
        shouldMuteAudioReason:
            shouldMuteAudioReasonValues.map[json["should_mute_audio_reason"]]!,
        shouldMuteAudioReasonType: json["should_mute_audio_reason_type"],
        isBookmarked: json["is_bookmarked"],
        overlapDurationInMs: json["overlap_duration_in_ms"],
        audioAssetStartTimeInMs: json["audio_asset_start_time_in_ms"],
        allowMediaCreationWithMusic: json["allow_media_creation_with_music"],
        isTrendingInClips: json["is_trending_in_clips"],
        formattedClipsMediaCount: json["formatted_clips_media_count"],
        streamingServices: json["streaming_services"],
        displayLabels: json["display_labels"],
        shouldAllowMusicEditing: json["should_allow_music_editing"],
      );

  Map<String, dynamic> toJson() => {
        "ig_artist": igArtist?.toJson(),
        "placeholder_profile_pic_url": placeholderProfilePicUrl,
        "should_mute_audio": shouldMuteAudio,
        "should_mute_audio_reason":
            shouldMuteAudioReasonValues.reverse[shouldMuteAudioReason],
        "should_mute_audio_reason_type": shouldMuteAudioReasonType,
        "is_bookmarked": isBookmarked,
        "overlap_duration_in_ms": overlapDurationInMs,
        "audio_asset_start_time_in_ms": audioAssetStartTimeInMs,
        "allow_media_creation_with_music": allowMediaCreationWithMusic,
        "is_trending_in_clips": isTrendingInClips,
        "formatted_clips_media_count": formattedClipsMediaCount,
        "streaming_services": streamingServices,
        "display_labels": displayLabels,
        "should_allow_music_editing": shouldAllowMusicEditing,
      };
}

enum ShouldMuteAudioReason { THIS_SONG_IS_CURRENTLY_UNAVAILABLE }

final shouldMuteAudioReasonValues = EnumValues({
  "This song is currently unavailable.":
      ShouldMuteAudioReason.THIS_SONG_IS_CURRENTLY_UNAVAILABLE
});

class OriginalSoundInfo {
  OriginalSoundInfo({
    required this.audioAssetId,
    this.musicCanonicalId,
    required this.progressiveDownloadUrl,
    required this.durationInMs,
    required this.dashManifest,
    required this.igArtist,
    required this.shouldMuteAudio,
    required this.hideRemixing,
    required this.originalMediaId,
    required this.timeCreated,
    required this.originalAudioTitle,
    required this.consumptionInfo,
    required this.canRemixBeSharedToFb,
    this.formattedClipsMediaCount,
    required this.allowCreatorToRename,
    required this.audioParts,
    required this.isExplicit,
    required this.originalAudioSubtype,
    required this.isAudioAutomaticallyAttributed,
    required this.isReuseDisabled,
    required this.isXpostFromFb,
    this.xpostFbCreatorInfo,
  });

  String audioAssetId;
  dynamic musicCanonicalId;
  String progressiveDownloadUrl;
  int durationInMs;
  String dashManifest;
  IgArtistClass igArtist;
  bool shouldMuteAudio;
  bool hideRemixing;
  String originalMediaId;
  int timeCreated;
  String originalAudioTitle;
  ConsumptionInfo consumptionInfo;
  bool canRemixBeSharedToFb;
  dynamic formattedClipsMediaCount;
  bool allowCreatorToRename;
  List<dynamic> audioParts;
  bool isExplicit;
  String originalAudioSubtype;
  bool isAudioAutomaticallyAttributed;
  bool isReuseDisabled;
  bool isXpostFromFb;
  dynamic xpostFbCreatorInfo;

  factory OriginalSoundInfo.fromJson(Map<String, dynamic> json) =>
      OriginalSoundInfo(
        audioAssetId: json["audio_asset_id"],
        musicCanonicalId: json["music_canonical_id"],
        progressiveDownloadUrl: json["progressive_download_url"],
        durationInMs: json["duration_in_ms"],
        dashManifest: json["dash_manifest"],
        igArtist: IgArtistClass.fromJson(json["ig_artist"]),
        shouldMuteAudio: json["should_mute_audio"],
        hideRemixing: json["hide_remixing"],
        originalMediaId: json["original_media_id"],
        timeCreated: json["time_created"],
        originalAudioTitle: json["original_audio_title"],
        consumptionInfo: ConsumptionInfo.fromJson(json["consumption_info"]),
        canRemixBeSharedToFb: json["can_remix_be_shared_to_fb"],
        formattedClipsMediaCount: json["formatted_clips_media_count"],
        allowCreatorToRename: json["allow_creator_to_rename"],
        audioParts: List<dynamic>.from(json["audio_parts"].map((x) => x)),
        isExplicit: json["is_explicit"],
        originalAudioSubtype: json["original_audio_subtype"],
        isAudioAutomaticallyAttributed:
            json["is_audio_automatically_attributed"],
        isReuseDisabled: json["is_reuse_disabled"],
        isXpostFromFb: json["is_xpost_from_fb"],
        xpostFbCreatorInfo: json["xpost_fb_creator_info"],
      );

  Map<String, dynamic> toJson() => {
        "audio_asset_id": audioAssetId,
        "music_canonical_id": musicCanonicalId,
        "progressive_download_url": progressiveDownloadUrl,
        "duration_in_ms": durationInMs,
        "dash_manifest": dashManifest,
        "ig_artist": igArtist.toJson(),
        "should_mute_audio": shouldMuteAudio,
        "hide_remixing": hideRemixing,
        "original_media_id": originalMediaId,
        "time_created": timeCreated,
        "original_audio_title": originalAudioTitle,
        "consumption_info": consumptionInfo.toJson(),
        "can_remix_be_shared_to_fb": canRemixBeSharedToFb,
        "formatted_clips_media_count": formattedClipsMediaCount,
        "allow_creator_to_rename": allowCreatorToRename,
        "audio_parts": List<dynamic>.from(audioParts.map((x) => x)),
        "is_explicit": isExplicit,
        "original_audio_subtype": originalAudioSubtype,
        "is_audio_automatically_attributed": isAudioAutomaticallyAttributed,
        "is_reuse_disabled": isReuseDisabled,
        "is_xpost_from_fb": isXpostFromFb,
        "xpost_fb_creator_info": xpostFbCreatorInfo,
      };
}

class ConsumptionInfo {
  ConsumptionInfo({
    required this.isBookmarked,
    required this.shouldMuteAudioReason,
    required this.isTrendingInClips,
    this.shouldMuteAudioReasonType,
    this.displayMediaId,
  });

  bool isBookmarked;
  String shouldMuteAudioReason;
  bool isTrendingInClips;
  dynamic shouldMuteAudioReasonType;
  dynamic displayMediaId;

  factory ConsumptionInfo.fromJson(Map<String, dynamic> json) =>
      ConsumptionInfo(
        isBookmarked: json["is_bookmarked"],
        shouldMuteAudioReason: json["should_mute_audio_reason"],
        isTrendingInClips: json["is_trending_in_clips"],
        shouldMuteAudioReasonType: json["should_mute_audio_reason_type"],
        displayMediaId: json["display_media_id"],
      );

  Map<String, dynamic> toJson() => {
        "is_bookmarked": isBookmarked,
        "should_mute_audio_reason": shouldMuteAudioReason,
        "is_trending_in_clips": isTrendingInClips,
        "should_mute_audio_reason_type": shouldMuteAudioReasonType,
        "display_media_id": displayMediaId,
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

  factory CommentInformTreatment.fromJson(Map<String, dynamic> json) =>
      CommentInformTreatment(
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

enum CommercialityStatus { NOT_COMMERCIAL }

final commercialityStatusValues =
    EnumValues({"not_commercial": CommercialityStatus.NOT_COMMERCIAL});

class CreativeConfig {
  CreativeConfig({
    required this.effectIds,
    required this.captureType,
    required this.creationToolInfo,
    required this.effectConfigs,
  });

  List<int> effectIds;
  String captureType;
  List<dynamic> creationToolInfo;
  List<EffectConfig> effectConfigs;

  factory CreativeConfig.fromJson(Map<String, dynamic> json) => CreativeConfig(
        effectIds: List<int>.from(json["effect_ids"].map((x) => x)),
        captureType: json["capture_type"],
        creationToolInfo:
            List<dynamic>.from(json["creation_tool_info"].map((x) => x)),
        effectConfigs: List<EffectConfig>.from(
            json["effect_configs"].map((x) => EffectConfig.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "effect_ids": List<dynamic>.from(effectIds.map((x) => x)),
        "capture_type": captureType,
        "creation_tool_info":
            List<dynamic>.from(creationToolInfo.map((x) => x)),
        "effect_configs":
            List<dynamic>.from(effectConfigs.map((x) => x.toJson())),
      };
}

class EffectConfig {
  EffectConfig({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory EffectConfig.fromJson(Map<String, dynamic> json) => EffectConfig(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ImageVersions2 {
  ImageVersions2({
    required this.candidates,
    required this.additionalCandidates,
    required this.smartThumbnailEnabled,
  });

  List<FirstFrame> candidates;
  AdditionalCandidates additionalCandidates;
  bool smartThumbnailEnabled;

  factory ImageVersions2.fromJson(Map<String, dynamic> json) => ImageVersions2(
        candidates: List<FirstFrame>.from(
            json["candidates"].map((x) => FirstFrame.fromJson(x))),
        additionalCandidates:
            AdditionalCandidates.fromJson(json["additional_candidates"]),
        smartThumbnailEnabled: json["smart_thumbnail_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "candidates": List<dynamic>.from(candidates.map((x) => x.toJson())),
        "additional_candidates": additionalCandidates.toJson(),
        "smart_thumbnail_enabled": smartThumbnailEnabled,
      };
}

class AdditionalCandidates {
  AdditionalCandidates({
    required this.igtvFirstFrame,
    required this.firstFrame,
    this.smartFrame,
  });

  FirstFrame igtvFirstFrame;
  FirstFrame firstFrame;
  dynamic smartFrame;

  factory AdditionalCandidates.fromJson(Map<String, dynamic> json) =>
      AdditionalCandidates(
        igtvFirstFrame: FirstFrame.fromJson(json["igtv_first_frame"]),
        firstFrame: FirstFrame.fromJson(json["first_frame"]),
        smartFrame: json["smart_frame"],
      );

  Map<String, dynamic> toJson() => {
        "igtv_first_frame": igtvFirstFrame.toJson(),
        "first_frame": firstFrame.toJson(),
        "smart_frame": smartFrame,
      };
}

class FirstFrame {
  FirstFrame({
    required this.width,
    required this.height,
    required this.url,
  });

  int width;
  int height;
  String url;

  factory FirstFrame.fromJson(Map<String, dynamic> json) => FirstFrame(
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

enum IntegrityReviewDecision { PENDING }

final integrityReviewDecisionValues =
    EnumValues({"pending": IntegrityReviewDecision.PENDING});

class Location {
  Location({
    required this.pk,
    required this.shortName,
    required this.facebookPlacesId,
    required this.externalSource,
    required this.name,
    required this.address,
    required this.city,
    required this.hasViewerSaved,
    this.lng,
    this.lat,
    required this.isEligibleForGuides,
  });

  String pk;
  ShortName shortName;
  String facebookPlacesId;
  ExternalSource externalSource;
  Name name;
  String address;
  String city;
  bool hasViewerSaved;
  double? lng;
  double? lat;
  bool isEligibleForGuides;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        pk: json["pk"],
        shortName: shortNameValues.map[json["short_name"]]!,
        facebookPlacesId: json["facebook_places_id"],
        externalSource: externalSourceValues.map[json["external_source"]]!,
        name: nameValues.map[json["name"]]!,
        address: json["address"],
        city: json["city"],
        hasViewerSaved: json["has_viewer_saved"],
        lng: json["lng"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        isEligibleForGuides: json["is_eligible_for_guides"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "short_name": shortNameValues.reverse[shortName],
        "facebook_places_id": facebookPlacesId,
        "external_source": externalSourceValues.reverse[externalSource],
        "name": nameValues.reverse[name],
        "address": address,
        "city": city,
        "has_viewer_saved": hasViewerSaved,
        "lng": lng,
        "lat": lat,
        "is_eligible_for_guides": isEligibleForGuides,
      };
}

enum ExternalSource { FACEBOOK_PLACES }

final externalSourceValues =
    EnumValues({"facebook_places": ExternalSource.FACEBOOK_PLACES});

enum Name { PAKISTAN, PAID_PROMOTIONS, ISLAMABAD_PAKISTAN }

final nameValues = EnumValues({
  "Islamabad, Pakistan": Name.ISLAMABAD_PAKISTAN,
  "Paid Promotions": Name.PAID_PROMOTIONS,
  "Pakistan": Name.PAKISTAN
});

enum ShortName { PAKISTAN, PAID_PROMOTIONS, ISLAMABAD }

final shortNameValues = EnumValues({
  "Islamabad": ShortName.ISLAMABAD,
  "Paid Promotions": ShortName.PAID_PROMOTIONS,
  "Pakistan": ShortName.PAKISTAN
});

enum LoggingInfoToken { THE_825651_DE16_B64_A28_AC085_C4_B25_C7_A02_F }

final loggingInfoTokenValues = EnumValues({
  "825651de16b64a28ac085c4b25c7a02f":
      LoggingInfoToken.THE_825651_DE16_B64_A28_AC085_C4_B25_C7_A02_F
});

class MediaCroppingInfo {
  MediaCroppingInfo({
    required this.squareCrop,
  });

  SquareCrop squareCrop;

  factory MediaCroppingInfo.fromJson(Map<String, dynamic> json) =>
      MediaCroppingInfo(
        squareCrop: SquareCrop.fromJson(json["square_crop"]),
      );

  Map<String, dynamic> toJson() => {
        "square_crop": squareCrop.toJson(),
      };
}

class SquareCrop {
  SquareCrop({
    required this.cropLeft,
    required this.cropRight,
    required this.cropTop,
    required this.cropBottom,
  });

  int cropLeft;
  double cropRight;
  double cropTop;
  double cropBottom;

  factory SquareCrop.fromJson(Map<String, dynamic> json) => SquareCrop(
        cropLeft: json["crop_left"],
        cropRight: json["crop_right"]?.toDouble(),
        cropTop: json["crop_top"]?.toDouble(),
        cropBottom: json["crop_bottom"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "crop_left": cropLeft,
        "crop_right": cropRight,
        "crop_top": cropTop,
        "crop_bottom": cropBottom,
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

  factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) =>
      SharingFrictionInfo(
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

class ItemUser {
  ItemUser({
    required this.hasAnonymousProfilePicture,
    required this.fanClubInfo,
    required this.transparencyProductEnabled,
    required this.isUnpublished,
    required this.pk,
    required this.pkId,
    required this.username,
    required this.fullName,
    required this.isPrivate,
    required this.isVerified,
    required this.profilePicId,
    required this.profilePicUrl,
    required this.accountBadges,
  });

  bool hasAnonymousProfilePicture;
  FanClubInfo fanClubInfo;
  bool transparencyProductEnabled;
  bool isUnpublished;
  String pk;
  String pkId;
  Username username;
  FullName fullName;
  bool isPrivate;
  bool isVerified;
  ProfilePicId profilePicId;
  String profilePicUrl;
  List<dynamic> accountBadges;

  factory ItemUser.fromJson(Map<String, dynamic> json) => ItemUser(
        hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
        fanClubInfo: FanClubInfo.fromJson(json["fan_club_info"]),
        transparencyProductEnabled: json["transparency_product_enabled"],
        isUnpublished: json["is_unpublished"],
        pk: json["pk"],
        pkId: json["pk_id"],
        username: usernameValues.map[json["username"]]!,
        fullName: fullNameValues.map[json["full_name"]]!,
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        profilePicId: profilePicIdValues.map[json["profile_pic_id"]]!,
        profilePicUrl: json["profile_pic_url"],
        accountBadges: List<dynamic>.from(json["account_badges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "has_anonymous_profile_picture": hasAnonymousProfilePicture,
        "fan_club_info": fanClubInfo.toJson(),
        "transparency_product_enabled": transparencyProductEnabled,
        "is_unpublished": isUnpublished,
        "pk": pk,
        "pk_id": pkId,
        "username": usernameValues.reverse[username],
        "full_name": fullNameValues.reverse[fullName],
        "is_private": isPrivate,
        "is_verified": isVerified,
        "profile_pic_id": profilePicIdValues.reverse[profilePicId],
        "profile_pic_url": profilePicUrl,
        "account_badges": List<dynamic>.from(accountBadges.map((x) => x)),
      };
}

class FanClubInfo {
  FanClubInfo({
    this.fanClubId,
    this.fanClubName,
    this.isFanClubReferralEligible,
    this.fanConsiderationPageRevampEligiblity,
    this.isFanClubGiftingEligible,
  });

  dynamic fanClubId;
  dynamic fanClubName;
  dynamic isFanClubReferralEligible;
  dynamic fanConsiderationPageRevampEligiblity;
  dynamic isFanClubGiftingEligible;

  factory FanClubInfo.fromJson(Map<String, dynamic> json) => FanClubInfo(
        fanClubId: json["fan_club_id"],
        fanClubName: json["fan_club_name"],
        isFanClubReferralEligible: json["is_fan_club_referral_eligible"],
        fanConsiderationPageRevampEligiblity:
            json["fan_consideration_page_revamp_eligiblity"],
        isFanClubGiftingEligible: json["is_fan_club_gifting_eligible"],
      );

  Map<String, dynamic> toJson() => {
        "fan_club_id": fanClubId,
        "fan_club_name": fanClubName,
        "is_fan_club_referral_eligible": isFanClubReferralEligible,
        "fan_consideration_page_revamp_eligiblity":
            fanConsiderationPageRevampEligiblity,
        "is_fan_club_gifting_eligible": isFanClubGiftingEligible,
      };
}

enum FullName { DR_SAHAR_ALI }

final fullNameValues = EnumValues({"Dr. Sahar Ali": FullName.DR_SAHAR_ALI});

enum ProfilePicId { THE_2958472952303103213687234972 }

final profilePicIdValues = EnumValues({
  "2958472952303103213_687234972": ProfilePicId.THE_2958472952303103213687234972
});

enum Username { DR_SAAHARALI }

final usernameValues = EnumValues({"dr.saaharali": Username.DR_SAAHARALI});

class Usertags {
  Usertags({
    required this.usertagsIn,
  });

  List<In> usertagsIn;

  factory Usertags.fromJson(Map<String, dynamic> json) => Usertags(
        usertagsIn: List<In>.from(json["in"].map((x) => In.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "in": List<dynamic>.from(usertagsIn.map((x) => x.toJson())),
      };
}

class In {
  In({
    required this.user,
    required this.position,
    this.startTimeInVideoInSec,
    this.durationInVideoInSec,
  });

  IgArtistClass user;
  List<int> position;
  dynamic startTimeInVideoInSec;
  dynamic durationInVideoInSec;

  factory In.fromJson(Map<String, dynamic> json) => In(
        user: IgArtistClass.fromJson(json["user"]),
        position: List<int>.from(json["position"].map((x) => x)),
        startTimeInVideoInSec: json["start_time_in_video_in_sec"],
        durationInVideoInSec: json["duration_in_video_in_sec"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "position": List<dynamic>.from(position.map((x) => x)),
        "start_time_in_video_in_sec": startTimeInVideoInSec,
        "duration_in_video_in_sec": durationInVideoInSec,
      };
}

class VideoVersion {
  VideoVersion({
    required this.type,
    required this.width,
    required this.height,
    required this.url,
    required this.id,
  });

  int type;
  int width;
  int height;
  String url;
  String id;

  factory VideoVersion.fromJson(Map<String, dynamic> json) => VideoVersion(
        type: json["type"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "width": width,
        "height": height,
        "url": url,
        "id": id,
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
