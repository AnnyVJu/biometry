import 'package:biometry/pages/step1_face/page1.dart';
import 'package:biometry/pages/step1_face/page2.dart';
import 'package:biometry/pages/step1_face/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenFinish extends StatefulWidget {
  const OnboardingScreenFinish({super.key});

  @override
  State<OnboardingScreenFinish> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreenFinish> {
  //controller to keep track of which page we're on
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            FacePage1(),
            FacePage2(),
            FacePage3(),
          ],
        ),

        //dot indicators
        Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color(0xFF0066B3),
              ),
            ))
      ]),
    );
  }
}
