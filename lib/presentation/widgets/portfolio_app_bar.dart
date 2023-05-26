import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/ui_extension.dart';

enum PortfolioAppBarTheme { dark, light }

class PortfolioAppBar extends StatefulWidget {
  final Animation<double> animation;
  final ScrollController? scrollController;
  final PortfolioAppBarTheme portfolioAppBarTheme;
  final String title;
  final String? upperPageTitle;

  const PortfolioAppBar(
      {Key? key,
      required this.animation,
      this.scrollController,
      this.portfolioAppBarTheme = PortfolioAppBarTheme.light,
      required this.title,
      this.upperPageTitle})
      : super(key: key);

  @override
  State<PortfolioAppBar> createState() => _PortfolioAppBarState();
}

class _PortfolioAppBarState extends State<PortfolioAppBar> {
  bool _showShadow = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _showShadow = widget.scrollController!.offset > 0;
    });
  }

  Color get primaryThemeColor => switch (widget.portfolioAppBarTheme) {
        PortfolioAppBarTheme.light => context.backgroundColor,
        PortfolioAppBarTheme.dark => context.primaryColor,
      };

  Color get secondaryThemeColor => switch (widget.portfolioAppBarTheme) {
        PortfolioAppBarTheme.light => context.primaryColor,
        PortfolioAppBarTheme.dark => context.backgroundColor,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.31.sh,
      padding:
          EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: primaryThemeColor,
        boxShadow: _showShadow
            ? [
                BoxShadow(
                  color: secondaryThemeColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          if (widget.upperPageTitle != null) ...[
            AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, widget.animation.value * 50.0),
                  child: SvgPicture.asset(
                    'assets/images/ic_up_arrow.svg',
                    colorFilter: ColorFilter.mode(
                        secondaryThemeColor, BlendMode.modulate),
                  ),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              widget.upperPageTitle!,
              style: context.pBodyLarge!.copyWith(
                color: secondaryThemeColor,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
          Row(
            children: [
              Text(
                widget.title,
                style: context.pDisplayMedium!.copyWith(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  color: secondaryThemeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController?.removeListener(_onScroll);
  }
}
