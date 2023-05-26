import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/data/repositories/personal_info_repository.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/utils/logger.dart';

@lazySingleton
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoRepository _repository;

  PersonalInfoCubit(this._repository) : super(PersonalInfoStateLoading());

  @override
  void onChange(Change<PersonalInfoState> change) {
    super.onChange(change);
    logi('PersonalInfoCubit', 'onChange',
        'current state = ${change.currentState}');
    logi('PersonalInfoCubit', 'onChange', 'next state = ${change.nextState}');
  }

  void getPersonalInfo() async {
    emit(PersonalInfoStateLoading());
    try {
      final data = await _repository.getPersonalInfo();
      emit(PersonalInfoStateSuccess(data));
    } catch (e) {
      emit(PersonalInfoStateFailed());
    }
  }
}
