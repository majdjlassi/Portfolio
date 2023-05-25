import 'package:flutter/cupertino.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';

abstract interface class BackendServiceApi {
  ///call backend to fetch all experiences (companies)
  @required
  Future<List<Experience>> fetchExperiencesList();

  //call backend to get personal info
  @required
  Future<PersonalInfo> getPersonalInfo();
}
