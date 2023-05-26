import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/presentation/widgets/cached_picture.dart';
import 'package:portfolio/presentation/widgets/link_tile.dart';
import 'package:portfolio/presentation/widgets/shimmer_effect_animation.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/ui_extension.dart';
import 'package:portfolio/presentation/widgets/clipper/custom_edge_clipper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  final Animation<double> animation;

  const HomePage({Key? key, required this.animation}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h) +
              EdgeInsets.only(top: 32.h),
          child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
            builder: (context, state) => switch (state) {
              PersonalInfoStateLoading() => Container(),
              PersonalInfoStateSuccess() => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(130.w),
                      child: SizedBox(
                        width: 130.w,
                        height: 130.w,
                        child: CachedPicture(
                          imageUrl: state.data.picture,
                          placeHolder: const ShimmerEffect(
                              width: double.infinity, height: double.infinity),
                          error: (error) => const Placeholder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: Text(
                        state.data.name,
                        style:
                            context.pDisplayMedium!.copyWith(letterSpacing: 5),
                      ),
                    ),
                  ],
                ),
              PersonalInfoStateFailed() => Container(),
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomEdgeClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: context.primaryColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EXPERIENCES',
                  style:
                      context.sBodyLarge!.copyWith(color: AppColors.white[200]),
                ),
                SizedBox(
                  height: 16.h,
                ),
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, widget.animation.value * 50.0),
                        child: SvgPicture.asset(
                            'assets/images/ic_down_arrow.svg'));
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          Positioned(
            top: 56.h,
            bottom: 0,
            right: 16.w,
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'ABOUT ME',
                    style: context.pBodyLarge!
                        .copyWith(color: context.primaryColor),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(widget.animation.value * 50.0, 0),
                      child: SvgPicture.asset(
                        'assets/images/ic_right_arrow.svg',
                        colorFilter: ColorFilter.mode(
                            context.primaryColor, BlendMode.modulate),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.78.sw,
            child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
              builder: (context, state) => Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: switch (state) {
                  PersonalInfoStateLoading() => Container(),
                  PersonalInfoStateSuccess() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_coding.svg',
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Flexible(
                                child: Text(
                                  state.data.position,
                                  style: context.sBodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            state.data.bio,
                            textAlign: TextAlign.justify,
                            style: context.sBodyLarge,
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'Contact',
                            style: context.pHeadlineSmall!
                                .copyWith(color: context.backgroundColor),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        LinkTile(
                          svgAsset: 'assets/images/ic_email.svg',
                          label: state.data.email,
                          onItemClick: () {
                            launchUrl(
                                Uri(scheme: 'mailto', path: state.data.email));
                          },
                        ),
                        LinkTile(
                          svgAsset: 'assets/images/ic_address.svg',
                          label: state.data.address,
                          onItemClick: () {
                            _openMapWithAddress(state.data.address);
                          },
                        ),
                        LinkTile(
                          svgAsset: 'assets/images/ic_mobile.svg',
                          label: state.data.number,
                          onItemClick: () {
                            launchUrl(
                                Uri(scheme: 'tel', path: state.data.number));
                          },
                        ),
                        LinkTile(
                          svgAsset: 'assets/images/ic_github.svg',
                          label: 'Github',
                          onItemClick: () {
                            launchUrlString(state.data.githubUrl);
                          },
                        ),
                        LinkTile(
                          svgAsset: 'assets/images/ic_linkedin.svg',
                          label: 'Linkedin',
                          onItemClick: () {
                            launchUrlString(state.data.linkedinUrl);
                          },
                        ),
                      ],
                    ),
                  PersonalInfoStateFailed() => Container(),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openMapWithAddress(String address) async {
    String encodedAddress = Uri.encodeComponent(address);
    String mapUrl = Platform.isAndroid
        ? 'https://maps.google.com/?q=$encodedAddress'
        : 'https://maps.apple.com/?address=$encodedAddress';

    if (await canLaunchUrl(Uri.parse(mapUrl))) {
      await launchUrlString(mapUrl);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
