import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'dart:math' as math;

import 'package:portfolio/widgets/Painter/corner_painter.dart';

class HomeScreen extends StatefulWidget {
  final Animation<double> animation;

  const HomeScreen({Key? key, required this.animation}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(1.sw, 1.sh),
            painter: CornerPainter(
              alignment: CornerPainterAlignment.bottomRight,
              backgroundColor: AppColors.black,
            ),
          ),
          Positioned(
            bottom: 16.w,
            left: 16.w,
            child: Column(
              children: [
                Text(
                  'MY EXPERIENCES',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white[200]),
                ),
                SizedBox(
                  height: 16.h,
                ),
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, widget.animation.value * 50.0),
                        child: SvgPicture.asset(
                            'assets/images/ic_down_arrow.svg'));
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 1.sh * 0.5,
            child: Transform.rotate(
              angle: math.pi / -2,
              child: Column(
                children: [
                  Text(
                    'ABOUT ME...',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.white[200]),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnimatedBuilder(
                    animation: widget.animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, widget.animation.value * 50.0),
                        child:
                            SvgPicture.asset('assets/images/ic_down_arrow.svg'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(130.w),
                      child: SizedBox(
                        width: 130.w,
                        height: 130.w,
                        child: Image.asset(
                          'assets/images/my_picture.jpeg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'MAJD\nJLASSI',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(letterSpacing: 3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/ic_coding.svg'),
                    SizedBox(
                      width: 16.w,
                    ),
                    Flexible(
                      child: Text(
                        'Mobile Application Developer',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.75.sw,
                      height: 0.5.sh,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(letterSpacing: 1, height: 1.85.h),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              '''Flutter/Android Developer with 5 years of experience designing and developing native and cross-platform mobile applications. Proficient in leveraging the Flutter framework to create robust and visually appealing user interfaces while ensuring seamless performance and responsiveness. Strong understanding of the mobile app development lifecycle, Agile methodologies, and UI/UX design principles. Capable of collaborating with cross-functional teams to deliver exceptional user experiences. Committed to staying current on the latest trends and technologies in the Flutter ecosystem.''',
                              speed: const Duration(milliseconds: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
