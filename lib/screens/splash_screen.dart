

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.displaySmall!,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Welcome To My Profile'),
                    ],
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset('assets/splach_screen_loading.json'),
          )
        ],
      ),
    );
  }
}
