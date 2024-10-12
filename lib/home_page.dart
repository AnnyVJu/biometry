import 'dart:developer';

import 'package:biometry/components/timeline_tile.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
          BioTimelineTile(isFirst: true, isLast: false, isPast: true, eventCard: Text('Начало'),),
          // middle timeline
          BioTimelineTile(isFirst: false, isLast: false, isPast: true, eventCard: Text('Лицо'),),
          BioTimelineTile(isFirst: false, isLast: false, isPast: true, eventCard: Text('Голос'),),
          //end timeline
          BioTimelineTile(isFirst: false, isLast: true, isPast: false, eventCard: Text('Завершение'),),
        ],
      ),
    );
  }
}