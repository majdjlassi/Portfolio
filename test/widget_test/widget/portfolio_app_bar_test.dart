import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/presentation/widgets/portfolio_app_bar.dart';

void main() {
  group('PortfolioAppBar', () {
    testWidgets('renders the app bar', (WidgetTester tester) async {
      const animationValue = 0.5;
      const portfolioAppBarTheme = PortfolioAppBarTheme.light;
      const title = 'My Portfolio';
      const upperPageTitle = 'Home';

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const PortfolioAppBar(
              animation: AlwaysStoppedAnimation(animationValue),
              portfolioAppBarTheme: portfolioAppBarTheme,
              title: title,
              upperPageTitle: upperPageTitle,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );
      // Verify that the app bar renders with the correct properties
      expect(find.text(title), findsOneWidget);
      expect(find.text(upperPageTitle), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is Transform), findsOneWidget);
    });

    testWidgets('renders the app bar without the swipe animation', (WidgetTester tester) async {
      const animationValue = 0.5;
      const portfolioAppBarTheme = PortfolioAppBarTheme.light;
      const title = 'My Portfolio';

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const PortfolioAppBar(
              animation: AlwaysStoppedAnimation(animationValue),
              portfolioAppBarTheme: portfolioAppBarTheme,
              title: title,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );
      // Verify that the app bar renders with the correct properties
      expect(find.byKey(Key(PortfolioAppBar.titleKey)), findsOneWidget);
      expect(find.byKey(Key(PortfolioAppBar.upperTitleKey)), findsNothing);
      expect(find.byType(SvgPicture), findsNothing);
      expect(find.byWidgetPredicate((widget) => widget is Transform), findsNothing);
    });
  });
}
