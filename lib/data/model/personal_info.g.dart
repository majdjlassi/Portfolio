// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalInfoAdapter extends TypeAdapter<PersonalInfo> {
  @override
  final int typeId = 0;

  @override
  PersonalInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalInfo(
      address: fields[0] as String,
      education: (fields[1] as List).cast<Education>(),
      email: fields[2] as String,
      githubUrl: fields[3] as String,
      resumeUrl: fields[4] as String,
      languages: (fields[5] as List).cast<Language>(),
      linkedinUrl: fields[6] as String,
      name: fields[7] as String,
      number: fields[8] as String,
      picture: fields[9] as String,
      bio: fields[10] as String,
      position: fields[11] as String,
      skills: (fields[12] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PersonalInfo obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.education)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.githubUrl)
      ..writeByte(4)
      ..write(obj.resumeUrl)
      ..writeByte(5)
      ..write(obj.languages)
      ..writeByte(6)
      ..write(obj.linkedinUrl)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.number)
      ..writeByte(9)
      ..write(obj.picture)
      ..writeByte(10)
      ..write(obj.bio)
      ..writeByte(11)
      ..write(obj.position)
      ..writeByte(12)
      ..write(obj.skills);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EducationAdapter extends TypeAdapter<Education> {
  @override
  final int typeId = 1;

  @override
  Education read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Education(
      address: fields[0] as String,
      degree: fields[1] as String,
      endDate: fields[2] as String,
      startDate: fields[3] as String,
      university: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Education obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.degree)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.university);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EducationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 2;

  @override
  Language read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Language(
      language: fields[0] as String,
      level: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      resumeUrl: json['resume_url'] as String,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      linkedinUrl: json['linkedin_url'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      picture: json['picture'] as String,
      bio: json['bio'] as String,
      position: json['position'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'education': instance.education,
      'email': instance.email,
      'github_url': instance.githubUrl,
      'resume_url': instance.resumeUrl,
      'languages': instance.languages,
      'linkedin_url': instance.linkedinUrl,
      'name': instance.name,
      'number': instance.number,
      'picture': instance.picture,
      'bio': instance.bio,
      'position': instance.position,
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
