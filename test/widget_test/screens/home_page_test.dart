import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_cubit.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_state.dart';
import 'package:portfolio/presentation/screens/home_page.dart';

class MockPersonalInfoCubit extends Mock implements PersonalInfoCubit {}

class MockResumeCubit extends Mock implements ResumeCubit {}

void main() {
  group('HomePage Widget', () {
    late MockPersonalInfoCubit personalInfoCubit;
    late ResumeCubit resumeCubit;
    late PersonalInfo personalInfo;
    late Task task;

    setUpAll(() {
      personalInfoCubit = MockPersonalInfoCubit();

      resumeCubit = MockResumeCubit();

      personalInfo = PersonalInfo(
        address: "123 Main St",
        education: [
          Education(
            address: "456 University Ave",
            degree: "Bachelor's Degree",
            endDate: "2022-05-01",
            startDate: "2018-09-01",
            university: "XYZ University",
          ),
          Education(
            address: "789 College Blvd",
            degree: "Master's Degree",
            endDate: "2024-05-01",
            startDate: "2022-09-01",
            university: "ABC University",
          ),
        ],
        email: "example@example.com",
        githubUrl: "https://github.com/example",
        resumeUrl: "https://example.com/resume.pdf",
        languages: [
          Language(language: "English", level: "Advanced"),
          Language(language: "Spanish", level: "Intermediate"),
        ],
        linkedinUrl: "https://linkedin.com/in/example",
        name: "John Doe",
        number: "123-456-7890",
        picture: "https://example.com/profile_picture.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        position: "Software Developer",
        skills: ["Flutter", "Dart", "Java"],
      );

      task = Task.createFromJsonMap({
        "url": "https://example.com/file",
        "taskType": "DownloadTask",
        "filename": "example_file",
        "requiresWiFi": true,
        "metaData": "additional_data",
        "allowPause": true
      });
    });

    setUp(() {
      when(() => personalInfoCubit.stream)
          .thenAnswer((_) => const Stream.empty());

      when(() => personalInfoCubit.close())
          .thenAnswer((_) => Future.value(null));

      when(() => personalInfoCubit.state)
          .thenReturn(PersonalInfoStateSuccess(personalInfo));

      when(() => resumeCubit.stream).thenAnswer((_) => const Stream.empty());

      when(() => resumeCubit.close()).thenAnswer((_) => Future.value(null));
    });

    final animationController = AnimationController(
      vsync: const TestVSync(),
    );

    testWidgets(
        'renders "Download cv" button when resume is not yet downloaded',
        (WidgetTester tester) async {
      when(() => resumeCubit.state).thenReturn(ResumeInitialState());

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: HomePage(animation: animationController),
            builder: (context, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<PersonalInfoCubit>(
                    create: (_) => personalInfoCubit,
                  ),
                  BlocProvider<ResumeCubit>(
                    create: (_) => resumeCubit,
                  ),
                ],
                child: MaterialApp(
                  home: child,
                ),
              );
            }),
      );

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Download C.v'), findsOneWidget);
    });

    testWidgets('renders "Open C.v" button when resume is downloaded',
        (WidgetTester tester) async {
      when(() => resumeCubit.state).thenReturn(ResumeDownloadedState(task));

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: HomePage(animation: animationController),
            builder: (context, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<PersonalInfoCubit>(
                    create: (_) => personalInfoCubit,
                  ),
                  BlocProvider<ResumeCubit>(
                    create: (_) => resumeCubit,
                  ),
                ],
                child: MaterialApp(
                  home: child,
                ),
              );
            }),
      );

      expect(find.text('Open C.v'), findsOneWidget);
    });
  });
}
