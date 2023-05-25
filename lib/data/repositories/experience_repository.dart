import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class ExperienceRepository {
  final BackendServiceApi _backendServiceApi;

  ExperienceRepository(this._backendServiceApi);

  Future<List<Experience>> getExperiencesList() async {
    try {
      return await _backendServiceApi.fetchExperiencesList();
    } catch (e) {
      loge('ExperienceRepository', 'getExperiences', e.toString());
      rethrow;
    }
  }
}
