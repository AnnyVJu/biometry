import 'package:biometry/home_page.dart';
import 'package:biometry/pages/step1_face/page1.dart';
import 'package:biometry/pages/step1_face/page2.dart';
import 'package:biometry/pages/step1_face/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenFace extends StatefulWidget {
  const OnboardingScreenFace({super.key});

  @override
  State<OnboardingScreenFace> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreenFace> {
  PageController _controller = PageController();
  bool onLastPage = false;
  late bool isPast;

  //controller to keep track of which page we're on

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            FacePage1(),
            FacePage2(),
            FacePage3(),
          ],
        ),

        //dot indicators
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 10,
                ),

                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done

                onLastPage
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue.shade900)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                  settings:
                                      RouteSettings(arguments: isPast = true)));
                       setState(() {

                       }); },
                        child: Text(
                          'Завершить',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('   Далее   ')),
              ],
            ))
      ]),
    );
  }
}