import 'package:biometry/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileCard extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  final String text;
  final IconData icon;
  const TimelineTileCard(
      {super.key,
        required this.isFirst,
        required this.isLast,
        required this.isPast,
        required this.eventCard,
        required this.text,
        required this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle:
          LineStyle(color: isPast ? Color(0xFF0066B3) : Color(0xFFEDF2FE)),
          indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? Color(0xFF0066B3) : Color(0xFFEDF2FE),
            iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : Color(0xFFEDF2FE),
            ),
          ),
          // event card
          endChild: EventCard(
            isPast: isPast,
            child: eventCard,
            text: text,
            icon: icon,
          )),
    );
  }
}
