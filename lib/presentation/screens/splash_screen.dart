import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/presentation/widgets/animated_dot_loading_widget.dart';
import 'package:portfolio/presentation/widgets/failed_widget.dart';
import 'package:portfolio/utils/routes.dart';
import 'package:portfolio/utils/ui_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PersonalInfoCubit>(context).getPersonalInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
        builder: (context, state) => switch (state) {
          PersonalInfoStateLoading() => Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: DefaultTextStyle(
                      textAlign: TextAlign.start,
                      style: context.pDisplayLarge!
                          .copyWith(fontWeight: FontWeight.w200),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Welcome\nTo My Portfolio',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 24.w,
                  right: 24.w,
                  child: AnimatedDotsLoadingWidget(
                    dotColor: context.primaryColor,
                    dotSpacing: 4.w,
                    dotSize: 12.w,
                  ),
                )
              ],
            ),
          PersonalInfoStateSuccess() => Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Text(
                      'Welcome\nTo My Portfolio',
                      textAlign: TextAlign.start,
                      style: context.pDisplayLarge!
                          .copyWith(fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 24.w,
                  right: 24.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(Routes.home);
                    },
                    child: Text(
                      'Start',
                      style: context.pHeadlineSmall!
                          .copyWith(color: context.backgroundColor),
                    ),
                  ),
                ),
              ],
            ),
          PersonalInfoStateFailed() => Stack(
              children: [
                FailedStateWidget(
                  errorText: 'Oops! Something went wrong.',
                  errorTextStyle: context.pHeadlineSmall!
                      .copyWith(color: context.primaryColor),
                  icon: Icons.error_outline,
                  iconColor: context.primaryColor,
                  iconSize: 88.w,
                ),
                Positioned(
                  bottom: 40.h,
                  left: 24.w,
                  right: 24.w,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PersonalInfoCubit>(context)
                          .getPersonalInfo();
                    },
                    child: Text(
                      'Retry',
                      style: context.pHeadlineSmall!
                          .copyWith(color: context.backgroundColor),
                    ),
                  ),
                ),
              ],
            ),
        },
      ),
    );
  }
}
