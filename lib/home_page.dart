import 'dart:developer';

import 'package:biometry/pages/step1_face/timeline_tile_face.dart';
import 'package:biometry/pages/step2_fingerprint/timeline_tile_finger.dart';
import 'package:biometry/pages/step1_face/onboarding_screen_face.dart';
import 'package:biometry/pages/step2_fingerprint/onboarding_screen_finger.dart';
import 'package:biometry/pages/step3_voice/onboarding_screen_voice.dart';
import 'package:biometry/pages/step3_voice/timeline_tile_voice.dart';
import 'package:biometry/pages/step4_finish/onboarding_screen_finish.dart';
import 'package:biometry/pages/step4_finish/timeline_tile_finish.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

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
      body: ListView(
        children: [
          // Start timeline
          TimelineTileFace(
            isFirst: true,
            isLast: false,
            isPast: isFirstTilePast, // используем состояние
            eventCard: OnboardingScreenFace(
              onComplete: () => completeOnboarding(0), // передаем индекс 0
            ),
          ),
          // Middle timeline
          TimelineTileFinger(
            isFirst: false,
            isLast: false,
            isPast: isSecondTilePast,
            eventCard: OnboardingScreenFinger(
              onComplete: () => completeOnboarding(1), // передаем индекс 1
            ),
          ),
          TimelineTileVoice(
            isFirst: false,
            isLast: false,
            isPast: isThirdTilePast,
            eventCard: OnboardingScreenVoice(
              onComplete: () => completeOnboarding(2), // передаем индекс 2
            ),
          ),
          // End timeline
          TimelineTileFinish(
            isFirst: false,
            isLast: true,
            isPast: isFourthTilePast,
            eventCard: OnboardingScreenFinish(),
          ),
        ],
      ),
    );

  }
}
