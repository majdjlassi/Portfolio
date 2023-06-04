import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/utils/const.dart';

@injectable
class LocalDatabaseImpl implements LocalDatabase {
  @override
  Future<List<Experience>> getExperiences() async {
    final box = await Hive.openBox<Experience>(kExperiencesBox);
    final experiences = box.values.toList();
    await box.close();
    return experiences;
  }

  @override
  Future<PersonalInfo?> getPersonalInfo() async {
    final box = await Hive.openBox<PersonalInfo>(kPersonalInfoBox);
    final personalInfo = box.get(kPersonalInfoBoxKey);
    await box.close();
    return personalInfo;
  }

  @override
  Future<void> saveExperiences(List<Experience> experiences) async {
    final box = await Hive.openBox<Experience>(kExperiencesBox);
    await box.addAll(experiences);
    await box.close();
  }

  @override
  Future<void> savePersonalInfo(PersonalInfo personalInfo) async {
    final box = await Hive.openBox<PersonalInfo>(kPersonalInfoBox);
    await box.put(kPersonalInfoBoxKey, personalInfo);
    await box.close();
  }

  @override
  Future<String?> getTaskId() async{
    final box = await Hive.openBox<String>(kResumeTaskIdBox);
    final taskId = box.get(kResumeTaskIdPersistenceKey);
    await box.close();
    return taskId;
  }

  @override
  Future<void> saveTaskId(String taskId) async{
    final box = await Hive.openBox<String>(kResumeTaskIdBox);
    await box.put(kResumeTaskIdPersistenceKey, taskId);
    await box.close();
  }
}
