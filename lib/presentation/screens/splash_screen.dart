import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart';
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_state.dart';
import 'package:portfolio/presentation/widgets/animated_dot_loading_widget.dart';
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

    Future.delayed(const Duration(seconds: 5))
        .whenComplete(() => BlocProvider.of<PersonalInfoCubit>(context).getPersonalInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PersonalInfoCubit, PersonalInfoState>(
        listener: (context, state){
          if(state case PersonalInfoStateSuccess()){
            Navigator.of(context).popAndPushNamed(Routes.home);
          }
        },
        child: Stack(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: AnimatedDotsLoadingWidget(
                  dotColor: context.primaryColor,
                  dotSpacing: 4.w,
                  dotSize: 12.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
