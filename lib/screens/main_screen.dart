import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_me_page.dart';
import 'package:portfolio/screens/experiences_page.dart';
import 'package:portfolio/screens/home_page.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool shouldScroll = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.1, end: 0.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: shouldScroll ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: (index){
            setState(() {
              shouldScroll = index == 0;
            });
          },
          children: [
            HomePage(
              animation: _animation,
            ),
            ExperiencePage(
              animation: _animation,
            ),
          ],
        ),
        AboutMePage(
          animation: _animation,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
