import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class PersonalInfoRepository {
  final BackendServiceApi _backendServiceApi;
  final LocalDatabase _localDatabase;

  PersonalInfoRepository(this._backendServiceApi, this._localDatabase);

  Future<PersonalInfo> getPersonalInfo() async {
    logd('PersonalInfoRepository', 'getPersonalInfo', 'Called');
    try {
      final personalInfo = await _backendServiceApi.getPersonalInfo();
      _localDatabase.savePersonalInfo(personalInfo);
      logd('PersonalInfoRepository', 'getPersonalInfo', 'data persisted');
      return personalInfo;
    } catch (e) {
      final personalInfo = await _localDatabase.getPersonalInfo();
      if (personalInfo == null) {
        loge('ExperienceRepository', 'getExperiences', e.toString());
        rethrow;
      } else {
        logd('PersonalInfoRepository', 'getPersonalInfo',
            'data fetched from local database');
        return personalInfo;
      }
    }
  }
}
