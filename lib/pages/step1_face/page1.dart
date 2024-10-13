import 'package:flutter/material.dart';
import 'dart:math';

class FacePage1 extends StatefulWidget {
  const FacePage1({super.key});

  @override
  _FacePage1State createState() => _FacePage1State();
}

class _FacePage1State extends State<FacePage1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Длительность анимации
      vsync: this,
    )..repeat(); // Запускаем анимацию в бесконечном цикле

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller); // Полный круг
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождаем ресурсы
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              double radius = 10; // Уменьшенный радиус
              double x = radius * cos(_animation.value); // Вычисляем координаты X
              double y = radius * sin(_animation.value); // Вычисляем координаты Y

              return Transform.translate(
                offset: Offset(x, y), // Смещение по координатам
                child: child,
              );
            },
            child: Icon(
              Icons.face, // Иконка головы
              size: 100,
              color: Color(0xFF0066B3),
            ),
          ),
          const SizedBox(height: 20), // Отступ между иконкой и текстом
          const Text(
            'Проведите лицом\nпо часовой стрелке',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
