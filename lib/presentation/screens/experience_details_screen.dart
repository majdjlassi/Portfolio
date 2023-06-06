import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/presentation/cubit/page_view_cubit/page_view_cubit_cubit.dart';
import 'package:portfolio/presentation/cubit/page_view_cubit/page_view_cubit_state.dart';
import 'package:portfolio/presentation/screens/project_page.dart';
import 'package:portfolio/presentation/widgets/cached_svg_picture.dart';
import 'package:portfolio/presentation/widgets/shimmer_effect_animation.dart';
import 'package:portfolio/utils/ui_extension.dart';
import 'package:portfolio/presentation/widgets/page_view_swipe_indicator.dart';

class ExperienceDetailsScreen extends StatefulWidget {
  final Experience experience;

  const ExperienceDetailsScreen({Key? key, required this.experience})
      : super(key: key);

  @override
  State<ExperienceDetailsScreen> createState() =>
      _ExperienceDetailsScreenState();
}

class _ExperienceDetailsScreenState extends State<ExperienceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  int activeIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageViewCubit>(
      create: (_) => PageViewCubit(_pageController.initialPage),
      child: Scaffold(
        backgroundColor: context.primaryColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_left_arrow.svg',
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'BACK',
                          style: context.sBodyLarge,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: widget.experience.id,
                        child: Container(
                          width: 88.w,
                          height: 88.w,
                          decoration: BoxDecoration(
                            color: context.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.w)),
                          ),
                          child: Center(
                            child: CachedSvgPicture(
                              imageUrl: widget.experience.logo,
                              width: 64.w,
                              placeHolder: ShimmerEffect(
                                width: 64.w,
                                height: 64.w,
                              ),
                              error: (error) {
                                return const Placeholder();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.experience.companyName,
                              style: context.sHeadlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.experience.position,
                              style: context.sBodyLarge,
                            ),
                            Text(widget.experience.duration,
                                style: context.sBodyLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _animation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 0.70.sh,
                  decoration: BoxDecoration(
                    color: context.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w),
                    ),
                  ),
                  child: Builder(builder: (context) {
                    return Column(
                      children: [
                        BlocBuilder<PageViewCubit, PageViewCubitState>(
                            builder: (context, state) {
                          return PageViewSwipeIndicator(
                            activeIndex: state.activeIndex,
                            itemCount: widget.experience.projects.length,
                            activeColor: context.primaryColor,
                            inactiveColor: context.backgroundColor,
                            activeBorderColor: context.primaryColor,
                            inactiveBorderColor: context.primaryColor,
                          );
                        }),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.experience.projects.length,
                            onPageChanged:
                                BlocProvider.of<PageViewCubit>(context)
                                    .onPageChanged,
                            itemBuilder: (context, index) {
                              return ProjectPage(
                                  project: widget.experience.projects[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
