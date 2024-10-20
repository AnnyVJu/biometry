import 'package:biometry/components/timeline_tile.dart';
import 'package:biometry/pages/step1_face/onboarding_screen_face.dart';
import 'package:biometry/pages/step2_fingerprint/onboarding_screen_finger.dart';
import 'package:biometry/pages/step3_voice/onboarding_screen_voice.dart';
import 'package:biometry/pages/step4_finish/onboarding_screen_finish.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFirstTilePast = false; // переменная для отслеживания состояния
  bool isSecondTilePast = false;
  bool isThirdTilePast = false;
  bool isFourthTilePast = false;

  void completeOnboarding(int pageIndex) {
    setState(() {
      if (pageIndex == 0) {
        isFirstTilePast = true;
      } else if (pageIndex == 1) {
        isSecondTilePast = true;
      } else if (pageIndex == 2) {
        isThirdTilePast = true;
      } else if (pageIndex == 3) {
        isFourthTilePast = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Start timeline
          TimelineTileCard(
            isFirst: true,
            isLast: false,
            isPast: isFirstTilePast, // используем состояние
            eventCard: OnboardingScreenFace(
              onComplete: () => completeOnboarding(0), // передаем индекс 0
            ),
            text: 'Биометрия лица',
            icon: Icons.face,
          ),
          // Middle timeline
          TimelineTileCard(
            isFirst: false,
            isLast: false,
            isPast: isSecondTilePast,
            eventCard: OnboardingScreenFinger(
              onComplete: () => completeOnboarding(1), // передаем индекс 1
            ),
            text: 'Отпечаток пальца',
            icon: Icons.fingerprint,
          ),
          TimelineTileCard(
            isFirst: false,
            isLast: false,
            isPast: isThirdTilePast,
            eventCard: OnboardingScreenVoice(
              onComplete: () => completeOnboarding(2), // передаем индекс 2
            ),
            text: 'Голос',
            icon: Icons.mic,
          ),
          // End timeline
          TimelineTileCard(
            isFirst: false,
            isLast: true,
            isPast: isFourthTilePast,
            eventCard: OnboardingScreenFinish(),
            text: 'Готово',
            icon: Icons.check,
          ),
        ],
      ),
    );
  }
}
