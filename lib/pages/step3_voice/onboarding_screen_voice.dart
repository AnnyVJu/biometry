import 'package:biometry/pages/step3_voice/page1.dart';
import 'package:biometry/pages/step3_voice/page2.dart';
import 'package:biometry/pages/step3_voice/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenVoice extends StatefulWidget {
  final VoidCallback onComplete; // callback для завершения
  const OnboardingScreenVoice({super.key, required this.onComplete});

  @override
  State<OnboardingScreenVoice> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreenVoice> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              VoicePage1(),
              VoicePage2(),
              VoicePage3(),
            ],
          ),

          // Dot indicators and navigation buttons
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

                // Next or Done button
                onLastPage
                    ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue.shade900,
                    ),
                  ),
                  onPressed: () {
                    widget.onComplete(); // Call the completion callback
                    Navigator.pop(context); // Close the current screen
                  },
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
                  child: Text('   Далее   '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
