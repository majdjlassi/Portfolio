import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class ExperienceRepository {
  final BackendServiceApi _backendServiceApi;
  final LocalDatabase _localDatabase;

  ExperienceRepository(this._backendServiceApi, this._localDatabase);

  Future<List<Experience>> getExperiencesList() async {
    logd('ExperienceRepository', 'getExperiencesList', 'Called');
    try {
      final experinces = await _backendServiceApi.fetchExperiencesList();
      _localDatabase.saveExperiences(experinces);
      logd('ExperienceRepository', 'getExperiencesList', 'data persisted');
      return experinces;
    } catch (e) {
      final localExperiences = await _localDatabase.getExperiences();
      if (localExperiences.isEmpty) {
        loge('ExperienceRepository', 'getExperiencesList', e.toString());
        rethrow;
      } else {
        logd('ExperienceRepository', 'getExperiencesList',
            'data fetched from local database');
        return localExperiences;
      }
    }
  }
}
