import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/repositories/experience_repository.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_state.dart';

class MockExperienceRepository extends Mock implements ExperienceRepository {}
class MockExperience extends Mock implements Experience {}

void main() {
  group('ExperienceCubit', () {
    late ExperienceCubit experienceCubit;
    late MockExperienceRepository mockRepository;
    late MockExperience mockExperience;

    setUp(() {
      mockExperience = MockExperience();
      mockRepository = MockExperienceRepository();
      experienceCubit = ExperienceCubit(mockRepository);
    });

    tearDown(() {
      experienceCubit.close();
    });

    test('check that initial state is ExperienceStateLoading', () {
      expect(experienceCubit.state is ExperienceStateLoading, true);
    });

    blocTest<ExperienceCubit, ExperienceState>(
      'emits ExperienceStateSuccess when fetching experiences is successful',
      build: () {
        when(()=> mockRepository.getExperiencesList()).thenAnswer((_) => Future.value([mockExperience]));
        return experienceCubit;
      },
      act: (cubit) => cubit.fetchExperiences(),
      expect: () => [
        isA<ExperienceStateLoading>(),
        isA<ExperienceStateSuccess<List<Experience>>>(),
      ],
    );

    blocTest<ExperienceCubit, ExperienceState>(
      'emits ExperienceStateFailed when fetching experiences is failed',
      build: () {
        when(()=> mockRepository.getExperiencesList()).thenThrow(Exception('failed'));
        return experienceCubit;
      },
      act: (cubit) => cubit.fetchExperiences(),
      expect: () => [
        isA<ExperienceStateLoading>(),
        isA<ExperienceStateFailed>(),
      ],
    );

  });
}
