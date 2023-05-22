import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/widgets/Painter/card_bottom_right_corner_painter.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const CustomCardWidget(
      {Key? key, required this.child, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: Theme.of(context).scaffoldBackgroundColor,
          )),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: CustomPaint(
              size: Size(64.w, 64.w),
              painter: CardBottomRightCornerPainter(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
            child: child,
          ),
        ],
      ),
    );
  }
}
