import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/Painter/corner_painter.dart';
import 'package:portfolio/widgets/custom_card_widget.dart';
import 'dart:math' as math;

class AboutMeScreen extends StatefulWidget {
  final Animation<double> animation;

  const AboutMeScreen({Key? key, required this.animation}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final _scrollController = ScrollController();
  bool _showShadow = false;

  double _containerHeight = 0.4.sh;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _containerHeight = 0.4.sh - _scrollController.offset > 0.35.sh
          ? 0.4.sh - _scrollController.offset
          : 0.35.sh;
      _showShadow = _scrollController.offset > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          AnimatedContainer(
            width: double.infinity,
            height: _containerHeight,
            decoration: BoxDecoration(
              color: AppColors.black,
              boxShadow: _showShadow
                  ? [
                      BoxShadow(
                        color: AppColors.scaffoldBackground.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            duration: const Duration(milliseconds: 100),
            child: CustomPaint(
              painter: CornerPainter(
                  alignment: CornerPainterAlignment.topLeft,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0.20.sh,
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: Column(
                        children: [
                          Text(
                            'HOME SCREEN',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
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
                                  'assets/images/ic_down_arrow.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).primaryColor,
                                      BlendMode.modulate),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.22.sw,
                    left: 0.22.sw,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 32.h, horizontal: 16.w),
                      child: Text(
                        'ABOUT\nME ...',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                              fontSize: 64.sp,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              letterSpacing: 5,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
              physics: const BouncingScrollPhysics(),
              child: body,
            ),
          ),
        ],
      ),
    );
  }

  Widget get body => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CONTACT',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 24.h,
                ),
                _contactDataRow(
                    'assets/images/ic_email.svg', 'JLMAJD3@GMAIL.COM'),
                SizedBox(
                  height: 12.h,
                ),
                _contactDataRow('assets/images/ic_address.svg',
                    'CHARLOTTE-E.-PAULY-STRAßE 16, 12587 BERLIN'),
                SizedBox(
                  height: 12.h,
                ),
                _contactDataRow(
                    'assets/images/ic_mobile.svg', '+49 175 3731344'),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomCardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Wrap(
                  spacing: 8.w,
                  runSpacing: -6.w,
                  children: [
                    _chip('FLUTTER SDK'),
                    _chip('DART'),
                    _chip('ANDROID SDK'),
                    _chip('KOTLIN'),
                    _chip('RESTFUL API'),
                    _chip('FIREBASE SERVICES'),
                    _chip('FLUTTER STATE MANAGEMENT (BLOC)'),
                    _chip('UNIT/WIDGET/GOLDEN TEST'),
                    _chip('UX/UI DESIGN'),
                    _chip('AGILE(SCRUM)'),
                    _chip('GIT VERSION CONTROL'),
                    _chip('CI/CD'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomCardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LANGUAGES',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 24.h,
                ),
                ..._languageProgress('ENGLISH', 1),
                SizedBox(
                  height: 16.h,
                ),
                ..._languageProgress('ARABIC', 1),
                SizedBox(
                  height: 16.h,
                ),
                ..._languageProgress('FRENCH', 0.65),
                SizedBox(
                  height: 16.h,
                ),
                ..._languageProgress('GERMAN', 0.10),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          linkRowData('assets/images/ic_github.svg', 'GITHUB'),
          Divider(
            height: 32.h,
            color: AppColors.black[300],
          ),
          linkRowData('assets/images/ic_linkedin.svg', 'Linkedin'),
        ],
      );

  Widget _contactDataRow(String asset, String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            asset,
            width: 24.w,
          ),
          SizedBox(
            width: 8.w,
          ),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      );

  Widget _chip(String label) => Chip(
        label: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(20.w)),
      );

  List<Widget> _languageProgress(String text, double progress) => [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          width: 0.6.sw,
          height: 8.h,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).scaffoldBackgroundColor),
            value: progress,
          ),
        ),
      ];

  Widget linkRowData(String svgAsset, String label) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAsset,
            width: 24.w,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
          SvgPicture.asset(
            'assets/images/ic_right_arrow.svg',
            height: 14.w,
          ),
        ],
      );

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
  }
}
