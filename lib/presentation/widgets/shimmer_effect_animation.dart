import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class ShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  final Duration duration;

  const ShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.duration = const Duration(milliseconds: 1000)});

  @override
  ShimmerEffectState createState() => ShimmerEffectState();
}

class ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..repeat(reverse: true);

    _animation = Tween(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.black[300]!,
                AppColors.black[100]!,
                AppColors.black[300]!,
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: GradientTranslation(_animation.value),
            ),
          ),
        );
      },
    );
  }
}

class GradientTranslation extends GradientTransform {
  final double offset;

  const GradientTranslation(this.offset);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    if (offset.isFinite) {
      return Matrix4.translationValues(offset * bounds.width, 0.0, 0.0);
    } else {
      return null; // Return null if the offset is not finite
    }
  }
}
