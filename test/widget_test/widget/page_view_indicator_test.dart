import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/presentation/widgets/page_view_swipe_indicator.dart';

void main() {
  group('PageViewSwipeIndicator', () {
    const activeIndex = 0;
    const activeColor = Colors.blue;
    const inactiveColor = Colors.grey;
    const activeBorderColor = Colors.blue;
    const inactiveBorderColor = Colors.grey;

    testWidgets('hide indicator in case itemCount equal or less than 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const PageViewSwipeIndicator(
              activeIndex: activeIndex,
              itemCount: 1,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              activeBorderColor: activeBorderColor,
              inactiveBorderColor: inactiveBorderColor,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AnimatedContainer), findsNothing);
    });

    testWidgets('check if the rendered indicators step are equal to item count',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const PageViewSwipeIndicator(
              activeIndex: activeIndex,
              itemCount: 3,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              activeBorderColor: activeBorderColor,
              inactiveBorderColor: inactiveBorderColor,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });

    testWidgets('renders the Indicator correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const PageViewSwipeIndicator(
              activeIndex: 0,
              itemCount: 3,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              activeBorderColor: activeBorderColor,
              inactiveBorderColor: inactiveBorderColor,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );

      await tester.pumpAndSettle();

      final activeStep = tester.widget<AnimatedContainer>(
        find
            .byWidgetPredicate((widget) => widget is AnimatedContainer)
            .at(0),
      );

      final inactiveStep = tester.widget<AnimatedContainer>(
        find
            .byWidgetPredicate((widget) => widget is AnimatedContainer)
            .at(1),
      );

      final activeStepConstraints = tester
          .element(find.byWidget(activeStep))
          .findRenderObject() as RenderBox;

      final inactiveStepConstraints = tester
          .element(find.byWidget(inactiveStep))
          .findRenderObject() as RenderBox;

      final activeContainerWidth = activeStepConstraints.size.width;
      final inactiveContainerWidth = inactiveStepConstraints.size.width;

      expect(activeContainerWidth > inactiveContainerWidth, true);

      for (int i = 0; i < 3; i++) {
        final container = tester.widget<AnimatedContainer>(
          find.byWidgetPredicate((widget) => widget is AnimatedContainer).at(i),
        );

        final expectedBorderColor =
            i == activeIndex ? activeBorderColor : inactiveBorderColor;

        final expectedColor = i == activeIndex ? activeColor : inactiveColor;

        final boxDecoration = (container.decoration as BoxDecoration);

        expect(boxDecoration.border?.bottom.color, expectedBorderColor);
        expect(boxDecoration.color, expectedColor);
      }
    });
  });
}
