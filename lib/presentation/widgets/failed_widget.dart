import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailedStateWidget extends StatelessWidget {
  final double iconSize;
  final IconData icon;
  final Color iconColor;
  final String errorText;
  final TextStyle? errorTextStyle;

  const FailedStateWidget(
      {super.key,
      this.iconSize = 88.0,
      required this.icon,
      required this.iconColor,
      required this.errorText,
      this.errorTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Text(
            errorText,
            textAlign: TextAlign.center,
            style: errorTextStyle,
          ),
        ),
      ],
    );
  }
}
