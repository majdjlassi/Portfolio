import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  String name;
  String? icon;
  String description;
  List<String>? images;
  String achievements;
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
