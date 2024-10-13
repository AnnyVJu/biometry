import 'package:flutter/material.dart';

class FacePage3 extends StatefulWidget {
  const FacePage3({super.key});

  @override
  _FacePage3State createState() => _FacePage3State();
}

class _FacePage3State extends State<FacePage3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Длительность одного цикла
      vsync: this,
    )..repeat(reverse: true); // Запускаем анимацию с обратным эффектом

    _animation = Tween<double>(begin: 0, end: 0.2).animate(_controller); // Поворот вверх и вниз
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
              return Transform.translate(
                offset: Offset(0, _animation.value * 100), // Движение вверх и вниз
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
            'Кивайте головой\nвверх и вниз',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
