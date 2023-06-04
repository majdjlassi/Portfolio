import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/model/project.dart';
import 'package:portfolio/utils/utils.dart';

part 'experience.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class Experience extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String companyName;

  @HiveField(2)
  String location;

  @HiveField(3)
  String position;

  @JsonKey(name: 'start_date')
  @HiveField(4)
  String startDate;

  @JsonKey(name: 'end_date')
  @HiveField(5)
  String endDate;

  @HiveField(6)
  String logo;

  @HiveField(7)
  List<Project> projects;

  Experience({
    required this.id,
    required this.companyName,
    required this.location,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.logo,
    required this.projects,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);

  String get duration => "${convertDate(startDate)} - $_presentEndDate";

  String get _presentEndDate =>
      endDate == 'Present' ? 'Present' : convertDate(endDate);
}
