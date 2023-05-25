// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';

import 'api_service.dart';

@injectable
class BackendServiceApiImpl implements BackendServiceApi {
  final Dio dio;
  late ApiService apiService;

  BackendServiceApiImpl(this.dio) {
    apiService = ApiService(dio);
  }

  @override
  Future<List<Experience>> fetchExperiencesList() {
    return apiService.getExperiences();
  }

  @override
  Future<PersonalInfo> getPersonalInfo() {
    return apiService.getPersonelInfo();
  }
}
