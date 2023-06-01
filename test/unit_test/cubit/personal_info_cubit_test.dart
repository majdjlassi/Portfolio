import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/repositories/personal_info_repository.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';

class MockPersonalInfoRepository extends Mock
    implements PersonalInfoRepository {}

class MockPersonalInfo extends Mock implements PersonalInfo {}

void main() {
  group('PersonalInfoCubit', () {
    late PersonalInfoCubit personalInfoCubit;
    late MockPersonalInfoRepository mockRepository;
    late MockPersonalInfo mockPersonalInfo;

    setUp(() {
      mockRepository = MockPersonalInfoRepository();
      mockPersonalInfo = MockPersonalInfo();
      personalInfoCubit = PersonalInfoCubit(mockRepository);
    });

    tearDown(() {
      personalInfoCubit.close();
    });

    test('check that initial state is PersonalInfoStateLoading', () {
      expect(personalInfoCubit.state, isA<PersonalInfoStateLoading>());
    });

    blocTest<PersonalInfoCubit, PersonalInfoState>(
      'emits PersonalInfoStateSuccess when getting personal info data is successful',
      build: () {
        when(() => mockRepository.getPersonalInfo())
            .thenAnswer((_) async => mockPersonalInfo);
        return personalInfoCubit;
      },
      act: (cubit) => cubit.getPersonalInfo(),
      expect: () => [
        isA<PersonalInfoStateLoading>(),
        isA<PersonalInfoStateSuccess>(),
      ],
    );

    blocTest<PersonalInfoCubit, PersonalInfoState>(
      'emits PersonalInfoStateFailed when getting personal info data is failed',
      build: () {
        when(() => mockRepository.getPersonalInfo())
            .thenThrow(Exception('failed'));
        return personalInfoCubit;
      },
      act: (cubit) => cubit.getPersonalInfo(),
      expect: () => [
        isA<PersonalInfoStateLoading>(),
        isA<PersonalInfoStateFailed>(),
      ],
    );
  });
}
