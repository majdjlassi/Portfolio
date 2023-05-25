import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Start position
    path.lineTo(size.width, size.height); // Bottom line
    path.lineTo(size.width - 88.w, size.height - 88.h); // Diagonal line
    path.lineTo(size.width - 88.w, 0); // up line
    path.lineTo(0, 0); // back to start line
    path.close(); // Connect last point to the start position
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to re-clip for now
  }
}