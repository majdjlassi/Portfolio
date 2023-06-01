import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/presentation/widgets/failed_widget.dart';

void main() {
  group('FailedStateWidget', () {
    testWidgets('renders the icon and error text correctly',
        (WidgetTester tester) async {
      const iconSize = 88.0;
      const icon = Icons.error;
      const iconColor = Colors.red;
      const errorText = 'Something went wrong';
      const errorTextStyle = TextStyle(color: Colors.black);

      await tester.pumpWidget(
        ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            child: const FailedStateWidget(
              iconSize: iconSize,
              icon: icon,
              iconColor: iconColor,
              errorText: errorText,
              errorTextStyle: errorTextStyle,
            ),
            builder: (context, child) {
              return MaterialApp(
                home: child,
              );
            }),
      );

      /// check if the icon was rendered with the right values
      expect(find.byIcon(icon), findsOneWidget);
      final iconWidget = tester.widget<Icon>(find.byIcon(icon));
      expect(iconWidget.size, equals(iconSize));
      expect(iconWidget.color, equals(iconColor));

      /// check if the error text was rendered with the right values
      expect(find.text(errorText), findsOneWidget);
      final textWidget = tester.widget<Text>(find.text(errorText));
      expect(textWidget.textAlign, equals(TextAlign.center));
      expect(textWidget.style, equals(errorTextStyle));
    });
  });
}
