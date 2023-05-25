// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      location: json['location'] as String,
      position: json['position'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      logo: json['logo'] as String,
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'location': instance.location,
      'position': instance.position,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'logo': instance.logo,
      'projects': instance.projects,
    };
