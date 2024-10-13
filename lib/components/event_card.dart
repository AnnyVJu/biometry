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
        color: isPast ? Color(0xFF0066B3) : Color(0xFFEDF2FE),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 20,
            color: Color(0xFFC2DDFD),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
              ),
      child: Stack(
        children: [
          // Фоновая иконка
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 100, // Размер иконки
                color: Colors.white.withOpacity(0.6), // Цвет иконки с прозрачностью
              ),
            ),
          ),
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Цвет текста
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
