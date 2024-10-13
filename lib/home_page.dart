import 'dart:developer';

import 'package:biometry/components/timeline_tile.dart';
import 'package:biometry/pages/step1_face/onboarding_screen_face.dart';
import 'package:biometry/pages/step2_fingerprint/onboarding_screen_finger.dart';
import 'package:biometry/pages/step3_voice/onboarding_screen_voice.dart';
import 'package:biometry/pages/step4_finish/onboarding_screen_finish.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          // start timeline
           BioTimelineTile(isFirst: true, isLast: false, isPast: false, eventCard: OnboardingScreenFace(),),
          // middle timeline
           BioTimelineTile(isFirst: false, isLast: false, isPast: false, eventCard: OnboardingScreenFinger(),),
           BioTimelineTile(isFirst: false, isLast: false, isPast: true, eventCard: OnboardingScreenVoice(),),
          //end timeline
           BioTimelineTile(isFirst: false, isLast: true, isPast: false, eventCard: OnboardingScreenFinish(),),
        ],
      ),
    );
  }
}
