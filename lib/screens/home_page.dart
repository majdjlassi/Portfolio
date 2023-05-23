import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/clipper/custom_edge_clipper.dart';

class HomePage extends StatefulWidget {
  final Animation<double> animation;

  const HomePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h) +
              EdgeInsets.only(top: 32.h),
          child: Row(
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
                    .displayMedium!
                    .copyWith(letterSpacing: 5),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomEdgeClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            width: 0.78.sw,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_coding.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).scaffoldBackgroundColor,
                            BlendMode.modulate),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Flexible(
                        child: Text(
                          'Mobile App Developer',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    '''Flutter/Android Developer with 5 years of experience designing and developing native and cross-platform mobile applications. Proficient in leveraging the Flutter framework to create robust and visually appealing user interfaces while ensuring seamless performance and responsiveness. Strong understanding of the mobile app development lifecycle, Agile methodologies, and UI/UX design principles. Capable of collaborating with cross-functional teams to deliver exceptional user experiences. Committed to staying current on the latest trends and technologies in the Flutter ecosystem.''',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.2.sp,
                        letterSpacing: 1.sp,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 0.2.sw,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'EXPERIENCES',
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
                                  offset:
                                      Offset(0, widget.animation.value * 50.0),
                                  child: SvgPicture.asset(
                                      'assets/images/ic_down_arrow.svg'));
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 56.h,
            bottom: 0,
            right: 16.w,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'ABOUT ME',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(widget.animation.value * 50.0, 0),
                      child: SvgPicture.asset(
                        'assets/images/ic_right_arrow.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryColor, BlendMode.modulate),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
