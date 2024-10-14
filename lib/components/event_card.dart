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
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Color(0xFFEDF2FE) : Color(0xFFFFFFFF),
        border: Border.all(
          color: Color(0xFFEDF2FE), // Adjust color as needed
          width: 2.0, // Adjust width as needed
        ),

        borderRadius: BorderRadius.circular(10),
              ),
      child: Stack(
        children: [
          // Фоновая иконка
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                icon,
                size: 70, // Размер иконки
                color: Color(0xFF0066B3).withOpacity(0.6), // Цвет иконки с прозрачностью
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF0B1F33), // Цвет текста
                ),
              ),
            ), // Текст поверх иконки
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => child),
              );
            },
          ),


        ],
      ),
    );
  }
}
