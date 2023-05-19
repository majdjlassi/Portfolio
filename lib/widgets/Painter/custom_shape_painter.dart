import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

//Copy this CustomPainter code to the Bottom of the File
class CustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint horizontalPaint = Paint()..style = PaintingStyle.fill;
    horizontalPaint.color = AppColors.black;

    canvas.drawRect(
        Rect.fromLTWH(
            size.width * 0.78, size.height / 2.5, size.width, size.height),
        horizontalPaint);

    Paint verticalPaint = Paint()..style = PaintingStyle.fill;
    verticalPaint.color = AppColors.black;
    canvas.drawRect(
        Rect.fromLTWH(0, size.height * 0.88, size.width, size.height),
        verticalPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
