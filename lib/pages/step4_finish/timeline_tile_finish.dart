import 'package:biometry/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileFinish extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  const TimelineTileFinish({super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: isPast? Colors.blue.shade900 : Colors.blue.shade100),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast? Colors.blue.shade900 : Colors.blue.shade100,
          iconStyle: IconStyle(iconData: Icons.done, color: isPast? Colors.white : Colors.blue.shade100,),
          ),
        // event card
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
        )
      ),
    );
  }
}
