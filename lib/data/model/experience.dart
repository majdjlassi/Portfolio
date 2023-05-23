import 'package:portfolio/utils/utils.dart';

class Experience {
  late int id;
  late String companyName;
  late String location;
  late String position;
  late String startDate;
  late String endDate;
  late String logo;
  late List<Project> projects;

  Experience(
      {required this.id,
      required this.companyName,
      required this.location,
      required this.position,
      required this.startDate,
      required this.endDate,
      required this.logo,
      required this.projects});

  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    location = json['location'];
    position = json['position'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    logo = json['logo'];
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects.add(Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['companyName'] = companyName;
    data['location'] = location;
    data['position'] = position;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['logo'] = logo;
    data['projects'] = projects.map((v) => v.toJson()).toList();
    return data;
  }

  String get duration => "${convertDate(startDate)} - $_presentEndDate";

  String get _presentEndDate =>
      endDate == 'Present' ? 'Present' : convertDate(endDate);
}

class Project {
  late String name;
  String? icon;
  late String description;
  late List<String> images;
  late String achievements;
  late List<String> technologies;

  Project(
      {required this.name,
      this.icon,
      required this.description,
      required this.images,
      required this.achievements,
      required this.technologies});

  Project.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    images = json['images'].cast<String>();
    achievements = json['achievements'];
    technologies = json['technologies'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    data['images'] = images;
    data['achievements'] = achievements;
    data['technologies'] = technologies;
    return data;
  }
}
