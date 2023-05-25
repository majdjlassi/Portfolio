// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/utils/const.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart'; // Generated file

@RestApi(baseUrl: kBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/experience.json")
  Future<List<Experience>> getExperiences();

  @GET("/personal_info.json")
  Future<PersonalInfo> getPersonelInfo();
}
