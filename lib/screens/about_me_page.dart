import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/portfolio_app_bar.dart';

class AboutMePage extends StatefulWidget {
  final Animation<double> animation;

  const AboutMePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final _scrollController = ScrollController();

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
                            Theme.of(context).primaryColor, BlendMode.modulate),
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RawScrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thumbColor: Theme.of(context).primaryColor,
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

  Widget get body => Column(
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
          style: Theme.of(context).textTheme.headlineSmall,
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
        ),
      ];

  List<Widget> get _languageSection => [
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
            colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor, BlendMode.modulate),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SvgPicture.asset(
            'assets/images/ic_right_arrow.svg',
            colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor, BlendMode.modulate),
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
