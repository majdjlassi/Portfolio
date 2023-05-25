import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart';
import 'package:portfolio/presentation/cubit/experience_cubit/experience_state.dart';
import 'package:portfolio/utils/routes.dart';
import 'package:portfolio/presentation/widgets/experience_tile.dart';
import 'package:portfolio/presentation/widgets/portfolio_app_bar.dart';

class ExperiencePage extends StatefulWidget {
  final Animation<double> animation;

  const ExperiencePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _scrollController = ScrollController();
  final cubit = GetIt.I<ExperienceCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchExperiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
        bloc: cubit,
        builder: (context, state) => switch (state) {
          ExperienceStateLoading() => Container(),
          ExperienceStateSuccess() => successWidget(state.data),
          ExperienceStateFailed() => Container(),
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
            color: Theme.of(context).colorScheme.background.withOpacity(0.4),
            indent: 88.w,
            endIndent: 16.w,
            thickness: 1.h,
            height: 0.h,
          );
        },
      );
}
