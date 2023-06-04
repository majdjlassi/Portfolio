import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';

abstract interface class LocalDatabase {
  Future<void> savePersonalInfo(PersonalInfo personalInfo);

  Future<PersonalInfo?> getPersonalInfo();

  Future<void> saveExperiences(List<Experience> experiences);

  Future<List<Experience>> getExperiences();

  Future<void> saveTaskId(String taskId);

  Future<String?> getTaskId();
}
