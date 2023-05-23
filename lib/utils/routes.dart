import 'package:flutter/material.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/screens/experience_details_screen.dart';
import 'package:portfolio/screens/main_screen.dart';

class Routes {
  static const String home = "/home";
  static const String experienceDetailsScreen = "/experience-details";

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name!) {
      case Routes.home:
        {
          return _materialRoute(const MainPageScreen());
        }
      case Routes.experienceDetailsScreen:
        {
          return _materialRoute(
            ExperienceDetailsScreen(
              experience: routeSettings.arguments as Experience,
            ),
          );
        }
      default:
        return null;
    }
  }

  static Route _materialRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}
