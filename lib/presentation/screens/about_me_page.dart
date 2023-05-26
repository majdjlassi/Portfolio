import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/presentation/widgets/animated_dot_loading_widget.dart';
import 'package:portfolio/presentation/widgets/failed_widget.dart';
import 'package:portfolio/presentation/widgets/portfolio_app_bar.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/resuable_widgets.dart';
import 'package:portfolio/utils/ui_extension.dart';

class AboutMePage extends StatefulWidget {
  final Animation<double> animation;

  const AboutMePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.3.sh), // Set the preferred height
        child: PortfolioAppBar(
          animation: widget.animation,
          scrollController: _scrollController,
          title: 'ABOUT ME',
          upperPageTitle: 'MY BLOG',
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(widget.animation.value * 50.0, 0),
                      child: SvgPicture.asset(
                        'assets/images/ic_left_arrow.svg',
                        colorFilter: ColorFilter.mode(
                            context.primaryColor, BlendMode.modulate),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 16.w,
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'HOME PAGE',
                    style: context.pBodyLarge!
                        .copyWith(color: context.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _body,
          ),
        ],
      ),
    );
  }

  Widget get _body => BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
        builder: (context, state) => switch (state) {
          PersonalInfoStateLoading() => Center(
              child: AnimatedDotsLoadingWidget(
                dotColor: context.primaryColor,
                dotSpacing: 4.w,
                dotSize: 12.w,
              ),
            ),
          PersonalInfoStateSuccess() => successWidget(state.data),
          PersonalInfoStateFailed() => FailedStateWidget(
              errorText: 'Oops! Something went wrong.',
              errorTextStyle: context.pHeadlineSmall,
              icon: Icons.error_outline,
              iconColor: context.primaryColor,
              iconSize: 88.w,
            ),
        },
      );

  Widget successWidget(PersonalInfo data) => RawScrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thumbColor: context.primaryColor,
        radius: Radius.circular(12.w),
        padding: EdgeInsets.only(right: 2.w),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._universitySection(data),
              divider,
              ..._skillsSections(data),
              divider,
              ..._languageSection(data),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      );

  List<Widget>_universitySection(PersonalInfo data) => [];

  List<Widget> _skillsSections(PersonalInfo data) => [
        Text(
          'Skills',
          style: context.pHeadlineSmall,
        ),
        SizedBox(
          height: 24.h,
        ),
        Wrap(
          spacing: 8.w,
          runSpacing: -6.w,
          children: data.skills.map((e) => chip(context, e)).toList(),
        ),
      ];

  List<Widget> _languageSection(PersonalInfo data) => data.languages
          .map((e) =>
              progressIndicator(context, e.language, double.parse(e.level)))
          .map(
            (e) => (
              e,
              SizedBox(
                height: 16.h,
              ),
            ),
          )
          .fold(
        [
          Text(
            'LANGUAGES',
            style: context.pHeadlineSmall,
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
        (previousValue, element) => [
          ...previousValue,
          element.$1,
          element.$2,
        ],
      )..removeLast();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


}
