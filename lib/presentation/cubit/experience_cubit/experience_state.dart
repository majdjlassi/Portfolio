sealed class ExperienceState {}

class ExperienceStateLoading extends ExperienceState {}

class ExperienceStateSuccess<T> extends ExperienceState {
  final T data;

  ExperienceStateSuccess(this.data);
}

class ExperienceStateFailed extends ExperienceState {}
