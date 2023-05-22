import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/data/module/experience.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';

class ExperiencePage extends StatefulWidget {
  final Animation<double> animation;

  const ExperiencePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _scrollController = ScrollController();

  final experiences = [
    Experience('Midge Medical GmbH, Berlin', 'Flutter Developer',
        'Jul 2022 - Present', 'assets/logo/midge_medical_logo.svg'),
    Experience('Value Digital Services, Tunis', 'Android Developer',
        'Feb 2021 - Mar 2022', 'assets/logo/value_logo.svg'),
    Experience('Ai Square, Tunis', 'Flutter Developer', 'Dec 2019 - Jan 2021',
        'assets/logo/ai-square-logo.svg'),
    Experience('8 Ways Media, Tunis', 'Android Developer',
        'feb 2019 - Dec 2019', 'assets/logo/8-ways-media-logo.svg'),
    Experience('Mobiblanc, Tunis', 'Android Developer', 'Jul 2018 - Dec 2019',
        'assets/logo/mobiblanc-logo.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PortfolioAppBar(
              animation: widget.animation,
              title: 'EXPERIENCE',
              upperPageTitle: 'Home Page',
              portfolioAppBarTheme: PortfolioAppBarTheme.dark,
              scrollController: _scrollController,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                itemCount: experiences.length,
                itemBuilder: (BuildContext context, int position) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(16.w)),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            experiences[position].logo,
                            width: 40.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experiences[position].companyName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                            Text(
                              experiences[position].position,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                            Text(
                              experiences[position].timeSpan,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_right_arrow.svg',
                        width: 12.w,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.scaffoldBackground.withOpacity(0.4),
                    indent: 72.w,
                    height: 32.h,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
