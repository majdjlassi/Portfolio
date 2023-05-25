import 'package:json_annotation/json_annotation.dart';

part 'personal_info.g.dart';

@JsonSerializable()
class PersonalInfo {
  String address;
  List<Education> education;
  String email;
  @JsonKey(name: 'github_url')
  String githubUrl;
  List<Language> languages;
  @JsonKey(name: 'linkedin_url')
  String linkedinUrl;
  String name;
  String number;
  String picture;
  List<String> skills;

  PersonalInfo({
    required this.address,
    required this.education,
    required this.email,
    required this.githubUrl,
    required this.languages,
    required this.linkedinUrl,
    required this.name,
    required this.number,
    required this.picture,
    required this.skills,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}

@JsonSerializable()
class Education {
  String address;
  String degree;
  @JsonKey(name: 'end_date')
  String endDate;
  @JsonKey(name: 'start_date')
  String startDate;
  String university;

  Education({
    required this.address,
    required this.degree,
    required this.endDate,
    required this.startDate,
    required this.university,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class Language {
  String language;
  String level;

  Language({
    required this.language,
    required this.level,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
