import 'package:background_downloader/background_downloader.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_cubit.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_state.dart';

class MockFileDownloader extends Mock implements FileDownloader {}

class MockLocalDatabase extends Mock implements LocalDatabase {}

class MockDatabase extends Mock implements Database {}

void main() {
  group('ResumeCubit', () {
    late ResumeCubit resumeCubit;
    late FileDownloader fileDownloader;
    late LocalDatabase localDatabase;
    late Database mockDatabase;

    setUp(() {
      fileDownloader = MockFileDownloader();
      localDatabase = MockLocalDatabase();
      resumeCubit = ResumeCubit(fileDownloader, localDatabase);
      mockDatabase = MockDatabase();
    });

    test('check initial state', () {
      expect(resumeCubit.state is ResumeDownloadLoadingState, true);
    });

    blocTest<ResumeCubit, ResumeState>('resume is not available offline',
        build: () {
          when(() => localDatabase.getTaskId())
              .thenAnswer((_) => Future.value(null));
          return resumeCubit;
        },
        act: (cubit) => cubit.checkResumeAvailibity(),
        expect: () => [
              isA<ResumeDownloadLoadingState>(),
              isA<ResumeInitialState>(),
            ]);

    blocTest<ResumeCubit, ResumeState>('resume is available offline',
        build: () {
          final taskRecord = TaskRecord(
              Task.createFromJsonMap({
                "url": "https://example.com/file",
                "taskType": "DownloadTask",
                "filename": "example_file",
                "requiresWiFi": true,
                "metaData": "additional_data",
                "allowPause": true
              }),
              TaskStatus.complete,
              1.0);
          when(() => localDatabase.getTaskId())
              .thenAnswer((_) => Future.value('12345'));
          when(() => fileDownloader.database).thenReturn(mockDatabase);

          when(() => mockDatabase.recordForId('12345'))
              .thenAnswer((_) => Future.value(taskRecord));
          return resumeCubit;
        },
        act: (cubit) => cubit.checkResumeAvailibity(),
        expect: () => [
              isA<ResumeDownloadLoadingState>(),
              isA<ResumeDownloadedState>(),
            ]);
  });
}
