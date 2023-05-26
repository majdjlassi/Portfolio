import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

extension TextThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get outlineColor => Theme.of(this).colorScheme.outline;
  Color get shadowColor => Theme.of(this).colorScheme.shadow;

  // primary text color - dark
  TextStyle? get pDisplayLarge => Theme.of(this).primaryTextTheme.displayLarge;

  TextStyle? get pDisplayMedium =>
      Theme.of(this).primaryTextTheme.displayMedium;

  TextStyle? get pDisplaySmall => Theme.of(this).primaryTextTheme.displaySmall;

  TextStyle? get pHeadlineLarge =>
      Theme.of(this).primaryTextTheme.headlineLarge;

  TextStyle? get pHeadlineMedium =>
      Theme.of(this).primaryTextTheme.headlineMedium;

  TextStyle? get pHeadlineSmall =>
      Theme.of(this).primaryTextTheme.headlineSmall;

  TextStyle? get pLabelLarge => Theme.of(this).primaryTextTheme.labelLarge;

  TextStyle? get pLabelMedium => Theme.of(this).primaryTextTheme.labelMedium;

  TextStyle? get pLabelSmall => Theme.of(this).primaryTextTheme.labelSmall;

  TextStyle? get pBodyLarge => Theme.of(this).primaryTextTheme.bodyLarge;

  TextStyle? get pBodyMedium => Theme.of(this).primaryTextTheme.bodyMedium;

  TextStyle? get pBodySmall => Theme.of(this).primaryTextTheme.bodySmall;

  // secondary text color - light

  TextStyle? get sDisplayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get sDisplayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get sDisplaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get sHeadlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get sHeadlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get sHeadlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get sLabelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get sLabelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get sLabelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get sBodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get sBodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get sBodySmall => Theme.of(this).textTheme.bodySmall;

  // disabled text color

  TextStyle? get dDisplayLarge => Theme.of(this)
      .primaryTextTheme
      .displayLarge!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dDisplayMedium => Theme.of(this)
      .primaryTextTheme
      .displayMedium!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dDisplaySmall => Theme.of(this)
      .primaryTextTheme
      .displaySmall!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dHeadlineLarge => Theme.of(this)
      .primaryTextTheme
      .headlineLarge!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dHeadlineMedium => Theme.of(this)
      .primaryTextTheme
      .headlineMedium!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dHeadlineSmall => Theme.of(this)
      .primaryTextTheme
      .headlineSmall!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dLabelLarge => Theme.of(this)
      .primaryTextTheme
      .labelLarge!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dLabelMedium => Theme.of(this)
      .primaryTextTheme
      .labelMedium!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dLabelSmall => Theme.of(this)
      .primaryTextTheme
      .labelSmall!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dBodyLarge => Theme.of(this)
      .primaryTextTheme
      .bodyLarge!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dBodyMedium => Theme.of(this)
      .primaryTextTheme
      .bodyMedium!
      .copyWith(color: AppColors.colorScheme.onBackground);

  TextStyle? get dBodySmall => Theme.of(this)
      .primaryTextTheme
      .bodySmall!
      .copyWith(color: AppColors.colorScheme.onBackground);
}
