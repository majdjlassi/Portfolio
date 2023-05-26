import 'package:portfolio/data/model/personal_info.dart';

sealed class PersonalInfoState {}

class PersonalInfoStateLoading extends PersonalInfoState {}

class PersonalInfoStateSuccess extends PersonalInfoState {
  final PersonalInfo data;

  PersonalInfoStateSuccess(this.data);
}

class PersonalInfoStateFailed extends PersonalInfoState {}
