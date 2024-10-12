import 'package:biometry/components/onboarding_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard ({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      },
      child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: isPast ? Colors.blue.shade100 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: child),
    );
  }
}
