import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class PersonalInfoRepository {
  final BackendServiceApi _backendServiceApi;

  PersonalInfoRepository(this._backendServiceApi);

  Future<PersonalInfo> getPersonalInfo() async {
    try {
      return await _backendServiceApi.getPersonalInfo();
    } catch (e) {
      loge('ExperienceRepository', 'getExperiences', e.toString());
      rethrow;
    }
  }
}
