// To parse this JSON data, do
//
//     final linkedInProfileUserModel = linkedInProfileUserModelFromJson(jsonString);

import 'dart:convert';

LinkedInProfileUserModel linkedInProfileUserModelFromJson(String str) =>
    LinkedInProfileUserModel.fromJson(json.decode(str));

String linkedInProfileUserModelToJson(LinkedInProfileUserModel data) =>
    json.encode(data.toJson());

class LinkedInProfileUserModel {
  LinkedInProfileUserModel({
    //  this.positionGroups,
    this.profileId,
    this.entityUrn,
    this.certifications,
    this.publications,
    this.patents,
    this.firstName,
    this.influencer,
    this.subTitle,
    this.info,
    this.profilePicture,
    this.awards,
    this.lastName,
    this.objectUrn,
    this.education,
    this.skills,
    this.projects,
    this.testScores,
    this.courses,
    this.volunteerExperiences,
    this.premium,
    this.birthDate,
    this.organizations,
    this.summary,
    this.languages,
    this.treasuryMedia,
    this.location,
    this.industry,
    this.detail,
  });

  // List<PositionGroup> positionGroups;
  String? profileId;
  String? detail;
  String? entityUrn;
  Awards? certifications;
  Awards? publications;
  Awards? patents;
  String? firstName;
  bool? influencer;
  String? subTitle;
  String? info;
  String? profilePicture;
  Awards? awards;
  String? lastName;
  String? objectUrn;
  List<Education>? education;
  List<String>? skills;
  List<Project>? projects;
  Awards? testScores;
  Awards? courses;
  Awards? volunteerExperiences;
  bool? premium;
  dynamic birthDate;
  Awards? organizations;
  String? summary;
  Languages? languages;
  Awards? treasuryMedia;
  Location? location;
  String? industry;

  factory LinkedInProfileUserModel.fromJson(Map<String, dynamic> json) =>
      LinkedInProfileUserModel(
        detail: json["detail"]??null,
        // positionGroups: List<PositionGroup>.from(json["position_groups"].map((x) => PositionGroup.fromJson(x))),
        profileId: json["profile_id"] ?? null,
        entityUrn: json["entity_urn"] ?? null,
        firstName: json["first_name"]??null,
        subTitle: json["sub_title"]??null,
        // info: json["info"],
        profilePicture: json["profile_picture"]??null,
        // awards: Awards.fromJson(json["awards"]),
        lastName: json["last_name"]??null,
        // objectUrn: json["object_urn"],
        // education: List<Education>.from(
        //     json["education"].map((x) => Education.fromJson(x))),
        // skills: List<String>.from(json["skills"].map((x) => x ?? "")),
        // projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
        // testScores: Awards.fromJson(json["test_scores"]),
        // courses: Awards.fromJson(json["courses"]),
        // volunteerExperiences: Awards.fromJson(json["volunteer_experiences"]),
        // premium: json["premium"],
        // birthDate: json["birth_date"],
        // organizations: Awards.fromJson(json["organizations"]),
        summary: json["summary"]??"",
        // languages: Languages.fromJson(json["languages"]),
        // treasuryMedia: Awards.fromJson(json["treasury_media"]),
        // location: Location.fromJson(json["location"]??"Lahore"),
        industry: json["industry"]??"",
      );

  Map<String, dynamic> toJson() => {
        // "position_groups": List<dynamic>.from(positionGroups.map((x) => x.toJson())),
        "profile_id": profileId,
        "entity_urn": entityUrn,
        "certifications": certifications!.toJson(),
        "publications": publications!.toJson(),
        "patents": patents!.toJson(),
        "first_name": firstName,
        "influencer": influencer,
        "sub_title": subTitle,
        "info": info,
        "profile_picture": profilePicture,
        "awards": awards!.toJson(),
        "last_name": lastName,
        "object_urn": objectUrn,
        "education": List<dynamic>.from(education!.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "projects": List<dynamic>.from(projects!.map((x) => x.toJson())),
        "test_scores": testScores!.toJson(),
        "courses": courses!.toJson(),
        "volunteer_experiences": volunteerExperiences!.toJson(),
        "premium": premium,
        "birth_date": birthDate,
        "organizations": organizations!.toJson(),
        "summary": summary,
        "languages": languages!.toJson(),
        "treasury_media": treasuryMedia!.toJson(),
        "location": location!.toJson(),
        "industry": industry,
      };
}

class Awards {
  Awards();

  factory Awards.fromJson(Map<String, dynamic> json) => Awards();

  Map<String, dynamic> toJson() => {};
}

class Education {
  Education({
    this.fieldOfStudy,
    this.degreeName,
    this.date,
    this.school,
  });

  String? fieldOfStudy;
  String? degreeName;
  Date? date;
  School? school;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        fieldOfStudy: json["field_of_study"]??"",
        degreeName: json["degree_name"]??"",
        date: Date.fromJson(json["date"]),
        school: School.fromJson(json["school"]),
      );

  Map<String, dynamic> toJson() => {
        "field_of_study": fieldOfStudy,
        "degree_name": degreeName,
        "date": date!.toJson(),
        "school": school!.toJson(),
      };
}

class Date {
  Date({
    this.end,
    this.start,
  });

  End? end;
  End? start;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        end: End.fromJson(json["end"]),
        start: End.fromJson(json["start"]),
      );

  Map<String, dynamic> toJson() => {
        "end": end!.toJson(),
        "start": start!.toJson(),
      };
}

class End {
  End({
    this.year,
    this.month,
  });

  int? year;
  int? month;

  factory End.fromJson(Map<String, dynamic> json) => End(
        year: json["year"]??0,
        month: json["month"]??0,
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
      };
}

class School {
  School({
    this.logo,
    this.name,
  });

  String? logo;
  String? name;

  factory School.fromJson(Map<String, dynamic> json) => School(
        logo: json["logo"]??"",
        name: json["name"]??"",
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "name": name,
      };
}

class Languages {
  Languages({
    this.profileLanguages,
    this.primaryLocale,
    this.supportedLocales,
  });

  Awards? profileLanguages;
  Locale? primaryLocale;
  List<Locale>? supportedLocales;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        profileLanguages: Awards.fromJson(json["profile_languages"]),
        primaryLocale: Locale.fromJson(json["primary_locale"]),
        supportedLocales: List<Locale>.from(
            json["supported_locales"].map((x) => Locale.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "profile_languages": profileLanguages!.toJson(),
        "primary_locale": primaryLocale!.toJson(),
        "supported_locales":
            List<dynamic>.from(supportedLocales!.map((x) => x.toJson())),
      };
}

class Locale {
  Locale({
    this.country,
    this.language,
  });

  String? country;
  String? language;

  factory Locale.fromJson(Map<String, dynamic> json) => Locale(
        country: json["country"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "language": language,
      };
}

class Location {
  Location({
    this.short,
    this.city,
    this.country,
    this.locationDefault,
    this.state,
  });

  String? short;
  String? city;
  String? country;
  String? locationDefault;
  String? state;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        short: json["short"],
        city: json["city"],
        country: json["country"],
        locationDefault: json["default"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "city": city,
        "country": country,
        "default": locationDefault,
        "state": state,
      };
}

class PositionGroup {
  PositionGroup({
    this.profilePositions,
    this.company,
    this.date,
    this.companyUrl,
  });

  List<ProfilePosition>? profilePositions;
  Company? company;
  Date? date;
  String? companyUrl;

  factory PositionGroup.fromJson(Map<String, dynamic> json) => PositionGroup(
        profilePositions: List<ProfilePosition>.from(
            json["profile_positions"].map((x) => ProfilePosition.fromJson(x))),
        company: Company.fromJson(json["company"]),
        date: Date.fromJson(json["date"]),
        companyUrl: json["company_url"],
      );

  Map<String, dynamic> toJson() => {
        "profile_positions":
            List<dynamic>.from(profilePositions!.map((x) => x.toJson())),
        "company": company!.toJson(),
        "date": date!.toJson(),
        "company_url": companyUrl,
      };
}

class Company {
  Company({
    this.logo,
    this.name,
    this.url,
    this.employees,
  });

  String? logo;
  String? name;
  String? url;
  Employees? employees;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        logo: json["logo"],
        name: json["name"],
        url: json["url"],
        employees: Employees.fromJson(json["employees"]),
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "name": name,
        "url": url,
        "employees": employees!.toJson(),
      };
}

class Employees {
  Employees({
    this.end,
    this.start,
  });

  int? end;
  int? start;

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        end: json["end"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "end": end,
        "start": start,
      };
}

class ProfilePosition {
  ProfilePosition({
    this.title,
    this.date,
    this.description,
    this.location,
    this.company,
  });

  String? title;
  Date? date;
  dynamic description;
  String? location;
  String? company;

  factory ProfilePosition.fromJson(Map<String, dynamic> json) =>
      ProfilePosition(
        title: json["title"],
        date: Date.fromJson(json["date"]),
        description: json["description"],
        location: json["location"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date!.toJson(),
        "description": description,
        "location": location,
        "company": company,
      };
}

class Project {
  Project({
    this.contributors,
    this.title,
    this.date,
    this.description,
  });

  List<Contributor>? contributors;
  String? title;
  Date? date;
  String? description;

  factory Project.fromJson(Map<dynamic, dynamic> json) => Project(
        contributors: List<Contributor>.from(
            json["contributors"].map((x) => Contributor.fromJson(x))),
        title: json["title"] ?? null,
        date: Date.fromJson(json["date"]),
        description: json["description"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "contributors":
            List<dynamic>.from(contributors!.map((x) => x.toJson())),
        "title": title,
        "date": date!.toJson(),
        "description": description,
      };
}

class Contributor {
  Contributor({
    this.firstName,
    this.lastName,
    this.headline,
    this.type,
  });

  String? firstName;
  String? lastName;
  String? headline;
  String? type;

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        headline: json["headline"] ?? null,
        type: json["type"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "headline": headline,
        "type": type,
      };
}
