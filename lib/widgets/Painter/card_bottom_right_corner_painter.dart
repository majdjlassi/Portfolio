import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class CardBottomRightCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    final double rectWidth = size.width * 0.3;
    final double rectHeight = size.height;

    final paint = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.fill;

    final horizontalPath = Path()
      ..moveTo(0, rectHeight)
      ..lineTo(0, rectHeight - rectWidth)
      ..lineTo(rectHeight, rectHeight - rectWidth)
      ..lineTo(rectHeight, rectHeight)
      ..close();

    canvas.drawPath(horizontalPath, paint);

    final verticalPath = Path()
      ..moveTo(rectHeight + 0.5, 0)
      ..lineTo(rectHeight - rectWidth, 0)
      ..lineTo(rectHeight - rectWidth, rectHeight)
      ..lineTo(rectHeight + 0.5, rectHeight)
      ..close();

    canvas.drawPath(verticalPath, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}