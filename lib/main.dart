import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/screens/main_page.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/screens/splash_screen.dart';
import 'package:portfolio/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: const SplashScreen(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Portfolio',
          theme: ThemeData(
            primarySwatch: AppColors.black,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            textTheme: TextTheme(
              displayLarge: TextStyle(
                fontSize: 57.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w900,
              ),
              displayMedium: TextStyle(
                fontSize: 45.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.bold,
              ),
              displaySmall: TextStyle(
                fontSize: 36.sp,
                color: AppColors.black[600],
                wordSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
              headlineLarge: TextStyle(
                fontSize: 32.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                fontSize: 28.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                fontSize: 24.sp,
                letterSpacing: 4.0,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
              labelLarge: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black[600],
              ),
              labelMedium: TextStyle(
                fontSize: 12.sp,
                color: AppColors.black[600],
              ),
              labelSmall: TextStyle(
                fontSize: 11.sp,
                color: AppColors.black[600],
              ),
              bodyLarge: TextStyle(
                fontSize: 16.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.w200,
              ),
              bodyMedium: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.w200,
              ),
              bodySmall: TextStyle(
                fontSize: 12.sp,
                color: AppColors.black[600],
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          home: child,
          routes: {
            Routes.home: (context) => const MainPageScreen(),
          },
        );
      },
    );
  }
}
