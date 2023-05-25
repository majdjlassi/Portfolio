// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      address: json['address'] as String,
      education: (json['education'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String,
      githubUrl: json['github_url'] as String,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      linkedinUrl: json['linkedin_url'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      picture: json['picture'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'education': instance.education,
      'email': instance.email,
      'github_url': instance.githubUrl,
      'languages': instance.languages,
      'linkedin_url': instance.linkedinUrl,
      'name': instance.name,
      'number': instance.number,
      'picture': instance.picture,
      'skills': instance.skills,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      address: json['address'] as String,
      degree: json['degree'] as String,
      endDate: json['end_date'] as String,
      startDate: json['start_date'] as String,
      university: json['university'] as String,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'address': instance.address,
      'degree': instance.degree,
      'end_date': instance.endDate,
      'start_date': instance.startDate,
      'university': instance.university,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      language: json['language'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'language': instance.language,
      'level': instance.level,
    };
