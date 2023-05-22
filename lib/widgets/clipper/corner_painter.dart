import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CornerPainterAlignment { bottomRight, topLeft, left }

class CornerPainter extends CustomPainter {
  final CornerPainterAlignment alignment;
  final Color backgroundColor;

  CornerPainter({required this.alignment, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double rectWidth = size.width;
    final double rectHeight = size.height * 0.4;
    final double squareSize = 90.h;

    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    switch (alignment) {
      case CornerPainterAlignment.topLeft:
        {
          canvas.drawPath(topLeft(rectWidth, size.height, squareSize), paint);
          break;
        }
      case CornerPainterAlignment.bottomRight:
        {
          canvas.drawPath(
              bottomRight(rectWidth, rectHeight, size.height, squareSize),
              paint);
          break;
        }
      case CornerPainterAlignment.left:
        {
          canvas.drawPath(
              left(rectWidth, rectHeight, size.height, squareSize), paint);
          break;
        }
    }
  }

  Path bottomRight(double rectWidth, double rectHeight, double parentHeight,
          double squareSize) =>
      Path()
        ..moveTo(0, parentHeight - squareSize)
        ..lineTo(0, parentHeight)
        ..lineTo(rectWidth, parentHeight)
        ..lineTo(rectWidth, rectHeight)
        ..lineTo(rectWidth - squareSize, rectHeight)
        ..lineTo(rectWidth - squareSize, parentHeight - squareSize)
        ..close();

  Path topLeft(double rectWidth, double rectHeight, double squareSize) => Path()
    ..moveTo(0, 0)
    ..lineTo(rectWidth, 0)
    ..lineTo(rectWidth, squareSize + 24.h)
    ..lineTo(squareSize, squareSize + 24.h)
    ..lineTo(squareSize, rectHeight)
    ..lineTo(0, rectHeight)
    ..close();

  Path left(double rectWidth, double rectHeight, double parentHeight,
          double squareSize) =>
      Path()
        ..moveTo(0, parentHeight)
        ..lineTo(squareSize, parentHeight)
        ..lineTo(squareSize, rectHeight - squareSize + 14.w)
        ..lineTo(0, rectHeight - squareSize + 14.w)
        ..close();

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
