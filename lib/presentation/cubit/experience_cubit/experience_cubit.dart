import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/data/repositories/experience_repository.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_state.dart';
import 'package:portfolio/utils/logger.dart';

@injectable
class ExperienceCubit extends Cubit<ExperienceState> {
  final ExperienceRepository _repository;

  ExperienceCubit(this._repository) : super(ExperienceStateLoading());

  @override
  void onChange(Change<ExperienceState> change) {
    super.onChange(change);
    logi('ExperienceCubit', 'onChange',
        'current state = ${change.currentState}');
    logi('ExperienceCubit', 'onChange', 'next state = ${change.nextState}');
  }

  void fetchExperiences() async {
    emit(ExperienceStateLoading());
    try {
      final data = await _repository.getExperiencesList();
      emit(ExperienceStateSuccess(data));
    } catch (e) {
      emit(ExperienceStateFailed());
    }
  }
}
