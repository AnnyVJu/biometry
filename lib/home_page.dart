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

  void completeOnboarding() {
    setState(() {
      isFirstTilePast = true; // меняем состояние при завершении
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          // start timeline
           TimelineTileFace(
             isFirst: true,
             isLast: false,
             isPast: isFirstTilePast,  // используем состояние
             eventCard: OnboardingScreenFace(onComplete: completeOnboarding),), // передаем callback,
          // middle timeline
           TimelineTileFinger(
             isFirst: false,
             isLast: false,
             isPast: false,
             eventCard: OnboardingScreenFinger(),),
           TimelineTileVoice(
             isFirst: false,
             isLast: false,
             isPast: false,
             eventCard: OnboardingScreenVoice(),),
          //end timeline
           TimelineTileFinish(
             isFirst: false,
             isLast: true,
             isPast: false,
             eventCard: OnboardingScreenFinish(),),
        ],
      ),
    );
  }
}
