import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/providers/local/database_config.dart';
import 'package:portfolio/di/injection.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/resume_cubit/resume_cubit.dart';
import 'package:portfolio/presentation/screens/splash_screen.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  DatabaseConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonalInfoCubit>(create: (_) => GetIt.I<PersonalInfoCubit>(),),
        BlocProvider<ExperienceCubit>(create: (_) => GetIt.I<ExperienceCubit>(),),
        BlocProvider<ResumeCubit>(create: (_) => GetIt.I<ResumeCubit>(),),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        child: const SplashScreen(),
        builder: (context, child) {
          return MaterialApp(
            title: 'Portfolio',
            color: AppColors.white,
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: AppColors.colorScheme,
                textTheme: TextTheme(
                  displayLarge: TextStyle(
                    fontSize: 57.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.w900,
                  ),
                  displayMedium: TextStyle(
                    fontSize: 45.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  displaySmall: TextStyle(
                    fontSize: 36.sp,
                    color: AppColors.colorScheme.onSecondary,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                  headlineLarge: TextStyle(
                    fontSize: 32.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineMedium: TextStyle(
                    fontSize: 28.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineSmall: TextStyle(
                    fontSize: 24.sp,
                    letterSpacing: 1.5,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  labelLarge: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.colorScheme.onSecondary,
                  ),
                  labelMedium: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.colorScheme.onSecondary,
                  ),
                  labelSmall: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.colorScheme.onSecondary,
                  ),
                  bodyLarge: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.normal,
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.normal,
                  ),
                  bodySmall: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.colorScheme.onSecondary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                primaryTextTheme: TextTheme(
                  displayLarge: TextStyle(
                    fontSize: 57.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                  displayMedium: TextStyle(
                    fontSize: 45.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  displaySmall: TextStyle(
                    fontSize: 36.sp,
                    color: AppColors.colorScheme.onPrimary,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                  headlineLarge: TextStyle(
                    fontSize: 32.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineMedium: TextStyle(
                    fontSize: 28.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineSmall: TextStyle(
                    fontSize: 24.sp,
                    letterSpacing: 1.5,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  labelLarge: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.colorScheme.onPrimary,
                  ),
                  labelMedium: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.colorScheme.onPrimary,
                  ),
                  labelSmall: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.colorScheme.onPrimary,
                  ),
                  bodyLarge: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.normal,
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.normal,
                  ),
                  bodySmall: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.colorScheme.onPrimary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(0.5.sw, 56.h)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.colorScheme.primary),
                    overlayColor: MaterialStateProperty.all<Color>(
                        AppColors.colorScheme.background.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
                scrollbarTheme: ScrollbarThemeData(
                    thumbVisibility: const MaterialStatePropertyAll(true),
                    trackBorderColor: MaterialStatePropertyAll(AppColors.white),
                    thumbColor: MaterialStatePropertyAll(AppColors.white),
                    mainAxisMargin: 35.w,
                    minThumbLength: 35.w)),
            home: child,
            onGenerateRoute: Routes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
