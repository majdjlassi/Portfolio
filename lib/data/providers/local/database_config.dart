import 'dart:io';

import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/model/project.dart';

class DatabaseConfig {
  static Future<void> init() async {
    final appDocumentDir = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDir?.path)
      ..registerAdapter(PersonalInfoAdapter())
      ..registerAdapter(LanguageAdapter())
      ..registerAdapter(EducationAdapter())
      ..registerAdapter<Experience>(ExperienceAdapter())
      ..registerAdapter(ProjectAdapter());
  }
}
