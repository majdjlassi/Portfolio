import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/model/project.dart';
import 'package:portfolio/utils/utils.dart';

part 'experience.g.dart';

@JsonSerializable()
class Experience {
  int id;
  String companyName;
  String location;
  String position;
  @JsonKey(name: 'start_date')
  String startDate;
  @JsonKey(name: 'end_date')
  String endDate;
  String logo;
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
