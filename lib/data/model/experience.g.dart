// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExperienceAdapter extends TypeAdapter<Experience> {
  @override
  final int typeId = 10;

  @override
  Experience read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Experience(
      id: fields[0] as int,
      companyName: fields[1] as String,
      location: fields[2] as String,
      position: fields[3] as String,
      startDate: fields[4] as String,
      endDate: fields[5] as String,
      logo: fields[6] as String,
      projects: (fields[7] as List).cast<Project>(),
    );
  }

  @override
  void write(BinaryWriter writer, Experience obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.position)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.logo)
      ..writeByte(7)
      ..write(obj.projects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperienceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
