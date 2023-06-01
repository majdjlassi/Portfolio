import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/data/repositories/personal_info_repository.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/screens/splash_screen.dart';
import 'package:portfolio/presentation/widgets/animated_dot_loading_widget.dart';
import 'package:portfolio/presentation/widgets/failed_widget.dart';

class MockPersonalInfo extends Mock implements PersonalInfo {}

class MockPersonalInfoRepo extends Mock implements PersonalInfoRepository {}

void main() {
  group('Splash screen', () {
    late PersonalInfoCubit personalInfoCubit;
    late MockPersonalInfoRepo mockPersonalInfoRepo;
    late MockPersonalInfo mockPersonalInfo;

    setUp(() {
      mockPersonalInfoRepo = MockPersonalInfoRepo();
      mockPersonalInfo = MockPersonalInfo();
      personalInfoCubit = PersonalInfoCubit(mockPersonalInfoRepo);
    });

    testWidgets('SplashScreen load data successfully',
        (WidgetTester tester) async {
      when(() => mockPersonalInfoRepo.getPersonalInfo())
          .thenAnswer((_) async => Future.value(mockPersonalInfo));

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const SplashScreen(),
            builder: (context, child) {
              return BlocProvider<PersonalInfoCubit>(
                create: (_) => personalInfoCubit,
                child: MaterialApp(
                  home: child,
                ),
              );
            }),
      );

      expect(find.byType(AnimatedTextKit), findsOneWidget);
      expect(find.byType(AnimatedDotsLoadingWidget), findsOneWidget);
      expect(find.byType(Text), findsNothing);
      expect(find.byType(FailedStateWidget), findsNothing);
      expect(find.byType(ElevatedButton), findsNothing);

      await tester.pumpAndSettle();

      expect(find.byType(AnimatedTextKit), findsNothing);
      expect(find.byType(AnimatedDotsLoadingWidget), findsNothing);
      expect(find.text('Welcome\nTo My Portfolio'), findsOneWidget);
      expect(find.text('Start'), findsOneWidget);
      expect(find.text('Retry'), findsNothing);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(FailedStateWidget), findsNothing);
    });

    testWidgets('SplashScreen load and fail', (WidgetTester tester) async {
      when(() => mockPersonalInfoRepo.getPersonalInfo())
          .thenThrow(Exception('Failed'));

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const SplashScreen(),
            builder: (context, child) {
              return BlocProvider<PersonalInfoCubit>(
                create: (_) => personalInfoCubit,
                child: MaterialApp(
                  home: child,
                ),
              );
            }),
      );

      expect(find.byType(AnimatedTextKit), findsOneWidget);
      expect(find.byType(AnimatedDotsLoadingWidget), findsOneWidget);
      expect(find.byType(Text), findsNothing);
      expect(find.byType(FailedStateWidget), findsNothing);
      expect(find.byType(ElevatedButton), findsNothing);

      await tester.pumpAndSettle();

      expect(find.byType(AnimatedTextKit), findsNothing);
      expect(find.byType(AnimatedDotsLoadingWidget), findsNothing);
      expect(find.text('Welcome\nTo My Portfolio'), findsNothing);
      expect(find.text('Start'), findsNothing);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(FailedStateWidget), findsOneWidget);
    });
  });
}
