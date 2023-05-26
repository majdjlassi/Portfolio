import 'package:flutter/material.dart';

class AnimatedDotsLoadingWidget extends StatefulWidget {
  final Color dotColor;
  final double dotSize;
  final double dotSpacing;
  final double animationDuration;

  const AnimatedDotsLoadingWidget({
    super.key,
    this.dotColor = Colors.blue,
    this.dotSize = 12.0,
    this.dotSpacing = 8.0,
    this.animationDuration = 800.0,
  });

  @override
  AnimatedDotsLoadingWidgetState createState() =>
      AnimatedDotsLoadingWidgetState();
}

class AnimatedDotsLoadingWidgetState extends State<AnimatedDotsLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration.toInt()),
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 2.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotColors = [
      widget.dotColor.withOpacity(0.3),
      widget.dotColor.withOpacity(0.6),
      widget.dotColor,
    ];

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final dotSize = widget.dotSize - index * 2.0;
            final dotOpacity = 1.0 - (index * 0.3);
            final dotColor = dotColors[index];

            final animatedValue = _animation.value;
            final scale = 1.0 - (animatedValue - index).abs();

            return Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: dotOpacity,
                child: Container(
                  width: dotSize,
                  height: widget.dotSize,
                  margin: EdgeInsets.symmetric(horizontal: widget.dotSpacing),
                  decoration: BoxDecoration(
                    color: dotColor,
                    borderRadius: BorderRadius.circular(dotSize / 2),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
