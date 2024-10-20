import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  final String text; // Параметр для текста
  final IconData icon; // Параметр для иконки

  const EventCard({
    super.key,
    required this.isPast,
    required this.child,
    required this.text, // Добавляем text в конструктор
    required this.icon, // Добавляем icon в конструктор
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => child),
        );
      },
      child: Flexible(
        fit: FlexFit.loose,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isPast ? Color(0xFFEDF2FE) : Color(0xFFFFFFFF),
            border: Border.all(
              color: Color(0xFFEDF2FE), // Adjust color as needed
              width: 2.0, // Adjust width as needed
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: [
              Icon(icon,
                  size: 70, // Размер иконки
                  color: Color(0xFF0066B3) // Цвет иконки
                  ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF0B1F33), // Цвет текста
                ),
              ),
              // Текст к иконке
            ],
          ),
        ),
      ),
    );
  }
}
