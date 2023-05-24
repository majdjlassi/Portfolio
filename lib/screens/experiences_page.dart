import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/routes.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/experience_tile.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';

class ExperiencePage extends StatefulWidget {
  final Animation<double> animation;

  const ExperiencePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _scrollController = ScrollController();

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
      body: FutureBuilder(
          future: fetchExperiences(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 24.h),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExperienceTile(
                    experience: snapshot.data![index],
                    onItemClick: () {
                      Navigator.of(context).pushNamed(
                          Routes.experienceDetailsScreen,
                          arguments: snapshot.data![index]);
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
            return Container();
          }),
    );
  }
}
