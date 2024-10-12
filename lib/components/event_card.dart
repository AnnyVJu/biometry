import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard ({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: isPast ? Colors.grey.shade200 : Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
