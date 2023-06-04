import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_state.dart';
import 'package:portfolio/presentation/widgets/animated_dot_loading_widget.dart';
import 'package:portfolio/presentation/widgets/failed_widget.dart';
import 'package:portfolio/utils/routes.dart';
import 'package:portfolio/presentation/widgets/experience_tile.dart';
import 'package:portfolio/presentation/widgets/portfolio_app_bar.dart';
import 'package:portfolio/utils/ui_extension.dart';

class ExperiencePage extends StatefulWidget {
  final Animation<double> animation;

  const ExperiencePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExperienceCubit>(context).fetchExperiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.3.sh),
        child: PortfolioAppBar(
          animation: widget.animation,
          title: 'EXPERIENCE',
          upperPageTitle: 'Home Page',
          portfolioAppBarTheme: PortfolioAppBarTheme.dark,
          scrollController: _scrollController,
        ),
      ),
      body: BlocBuilder<ExperienceCubit, ExperienceState>(
        builder: (context, state) => switch (state) {
          ExperienceStateLoading() => Center(
              child: AnimatedDotsLoadingWidget(
                dotColor: context.backgroundColor,
                dotSpacing: 4.w,
                dotSize: 12.w,
              ),
            ),
          ExperienceStateSuccess() => successWidget(state.data),
          ExperienceStateFailed() => FailedStateWidget(
              errorText: 'Oops! Something went wrong.',
              errorTextStyle: context.pHeadlineSmall!
                  .copyWith(color: context.backgroundColor),
              icon: Icons.error_outline,
              iconColor: context.backgroundColor,
              iconSize: 88.w,
            ),
        },
      ),
    );
  }

  Widget successWidget(List<Experience> data) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ExperienceTile(
            experience: data[index],
            onItemClick: () {
              Navigator.of(context).pushNamed(Routes.experienceDetailsScreen,
                  arguments: data[index]);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: context.backgroundColor.withOpacity(0.4),
            indent: 88.w,
            endIndent: 16.w,
            thickness: 1.h,
            height: 0.h,
          );
        },
      );
}
