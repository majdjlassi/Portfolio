import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor black =
      const MaterialColor(_primaryBlackColor, <int, Color>{
    50: Color(0xFFE0E0E0),
    100: Color(0xFFCBCBCB),
    200: Color(0xFFB5B5B5),
    300: Color(0xFFA2A2A2),
    400: Color(0xFF7D7D7D),
    500: Color(0xFF5C5C5C),
    600: Color(0xFF3C3C3C),
    700: Color(0xFF242424),
    800: Color(0xFF161616),
    900: Color(_primaryBlackColor),
  });
  static const int _primaryBlackColor = 0xFF000000;

  static MaterialColor white =
      const MaterialColor(_primaryWhiteColor, <int, Color>{
    50: Color(_primaryWhiteColor),
    100: Color(0xFFEEF5F5),
    200: Color(0xFFE8F3F3),
    300: Color(0xFFDFE8E8),
    400: Color(0xFFDDEAEA),
  });
  static const int _primaryWhiteColor = 0xFFFFFFFF;

  static const Color scaffoldBackground = Color(0xFFEEF5F5);

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF000000),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF242424),
    onSecondary: Color(0xFF3C3C3C),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFEEF5F5),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFEEF5F5),
    onSurface: Color(0xFF000000),
    outline: Color(0xFF000000),
    shadow: Color(0xFF000000),
  );
}
