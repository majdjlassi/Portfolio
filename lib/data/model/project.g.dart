// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 11;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      name: fields[0] as String,
      icon: fields[1] as String?,
      description: fields[2] as String,
      images: (fields[3] as List?)?.cast<String>(),
      achievements: fields[4] as String,
      technologies: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.achievements)
      ..writeByte(5)
      ..write(obj.technologies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      name: json['name'] as String,
      icon: json['icon'] as String?,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      achievements: json['achievements'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
      'images': instance.images,
      'achievements': instance.achievements,
      'technologies': instance.technologies,
    };
