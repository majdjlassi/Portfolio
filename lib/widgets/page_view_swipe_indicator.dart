import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewSwipeIndicator extends StatefulWidget {
  final int activeIndex;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;

  const PageViewSwipeIndicator({
    super.key,
    required this.activeIndex,
    required this.itemCount,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PageViewSwipeIndicatorState createState() => _PageViewSwipeIndicatorState();
}

class _PageViewSwipeIndicatorState extends State<PageViewSwipeIndicator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(widget.itemCount, (index) {
          return Builder(
            builder: (context) {
              double widthScale = 1.0;
              if (widget.activeIndex == index) {
                widthScale = 2.5;
              }
              return AnimatedContainer(
                width: 8.w * widthScale,
                height: 8.w,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.activeIndex.round() == index
                          ? widget.activeBorderColor
                          : widget.inactiveBorderColor),
                  color: widget.activeIndex.round() == index
                      ? widget.activeColor
                      : widget.inactiveColor,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          );
        }).skipWhile((element) => widget.itemCount <= 1).toList(),
      ),
    );
  }
}
