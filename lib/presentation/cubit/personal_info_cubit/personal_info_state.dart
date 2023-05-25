sealed class PersonalInfoState {}

class PersonalInfoStateLoading extends PersonalInfoState {}

class PersonalInfoStateSuccess<T> extends PersonalInfoState {
  final T data;

  PersonalInfoStateSuccess(this.data);
}

class PersonalInfoStateFailed extends PersonalInfoState {}
