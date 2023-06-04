import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/utils/utils.dart';

part 'personal_info.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class PersonalInfo {
  @HiveField(0)
  String address;

  @HiveField(1)
  List<Education> education;

  @HiveField(2)
  String email;

  @HiveField(3)
  @JsonKey(name: 'github_url')
  String githubUrl;

  @HiveField(4)
  @JsonKey(name: 'resume_url')
  String resumeUrl;

  @HiveField(5)
  List<Language> languages;

  @HiveField(6)
  @JsonKey(name: 'linkedin_url')
  String linkedinUrl;

  @HiveField(7)
  String name;

  @HiveField(8)
  String number;

  @HiveField(9)
  String picture;

  @HiveField(10)
  String bio;

  @HiveField(11)
  String position;

  @HiveField(12)
  List<String> skills;

  PersonalInfo({
    required this.address,
    required this.education,
    required this.email,
    required this.githubUrl,
    required this.resumeUrl,
    required this.languages,
    required this.linkedinUrl,
    required this.name,
    required this.number,
    required this.picture,
    required this.bio,
    required this.position,
    required this.skills,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Education {
  @HiveField(0)
  String address;

  @HiveField(1)
  String degree;

  @HiveField(2)
  @JsonKey(name: 'end_date')
  String endDate;

  @HiveField(3)
  @JsonKey(name: 'start_date')
  String startDate;

  @HiveField(4)
  String university;

  String get duration => "${convertDate(startDate)} - $_presentEndDate";

  String get _presentEndDate =>
      endDate == 'Present' ? 'Present' : convertDate(endDate);

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

@HiveType(typeId: 2)
@JsonSerializable()
class Language {
  @HiveField(0)
  String language;

  @HiveField(1)
  String level;

  Language({
    required this.language,
    required this.level,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
