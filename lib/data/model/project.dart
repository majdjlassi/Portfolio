import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class Project extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? icon;

  @HiveField(2)
  String description;

  @HiveField(3)
  List<String>? images;

  @HiveField(4)
  String achievements;

  @HiveField(5)
  List<String> technologies;

  Project({
    required this.name,
    this.icon,
    required this.description,
    this.images,
    required this.achievements,
    required this.technologies,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
