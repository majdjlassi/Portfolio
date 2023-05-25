import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
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
  final _cubit = GetIt.I<PersonalInfoCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.getPersonalInfo();
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
                            Theme.of(context).colorScheme.primary,
                            BlendMode.modulate),
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
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RawScrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thumbColor: Theme.of(context).colorScheme.primary,
              radius: Radius.circular(12.w),
              padding: EdgeInsets.only(right: 2.w),
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                physics: const BouncingScrollPhysics(),
                child: body,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get body => BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
        bloc: _cubit,
        builder: (context, state) => switch (state) {
          PersonalInfoStateLoading() => Container(),
          PersonalInfoStateSuccess() => successWidget,
          PersonalInfoStateFailed() => Container(),
        },
      );

  Widget get successWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._contactSection,
          _divider,
          ..._skillsSections,
          _divider,
          ..._languageSection,
          SizedBox(
            height: 40.h,
          ),
          linkRowData('assets/images/ic_github.svg', 'GITHUB'),
          _divider,
          linkRowData('assets/images/ic_linkedin.svg', 'Linkedin'),
        ],
      );

  Widget get _divider => Divider(
        color: AppColors.black.withOpacity(0.4),
        indent: 32.w,
        height: 40.h,
      );

  List<Widget> get _contactSection => [
        Text(
          'CONTACT',
          style: context.pHeadlineSmall,
        ),
        SizedBox(
          height: 24.h,
        ),
        _contactDataRow('assets/images/ic_email.svg', 'JLMAJD3@GMAIL.COM'),
        SizedBox(
          height: 12.h,
        ),
        _contactDataRow('assets/images/ic_address.svg',
            'CHARLOTTE-E.-PAULY-STRAßE 16, 12587 BERLIN'),
        SizedBox(
          height: 12.h,
        ),
        _contactDataRow('assets/images/ic_mobile.svg', '+49 175 3731344'),
      ];

  List<Widget> get _skillsSections => [
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
          children: [
            chip(context, 'FLUTTER SDK'),
            chip(context, 'DART'),
            chip(context, 'ANDROID SDK'),
            chip(context, 'KOTLIN'),
            chip(context, 'RESTFUL API'),
            chip(context, 'FIREBASE SERVICES'),
            chip(context, 'FLUTTER STATE MANAGEMENT (BLOC)'),
            chip(context, 'UNIT/WIDGET/GOLDEN TEST'),
            chip(context, 'UX/UI DESIGN'),
            chip(context, 'AGILE(SCRUM)'),
            chip(context, 'GIT VERSION CONTROL'),
            chip(context, 'CI/CD'),
          ],
        ),
      ];

  List<Widget> get _languageSection => [
        Text(
          'LANGUAGES',
          style: context.pHeadlineSmall,
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
      ];

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
              style: context.pLabelLarge,
            ),
          ),
        ],
      );

  List<Widget> _languageProgress(String text, double progress) => [
        Text(
          text,
          style: context.pLabelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          height: 8.h,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.background),
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
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.modulate),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Text(
              label,
              style: context.pHeadlineSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SvgPicture.asset(
            'assets/images/ic_right_arrow.svg',
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.modulate),
            height: 14.w,
          ),
        ],
      );

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
