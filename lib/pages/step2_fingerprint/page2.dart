import 'package:flutter/material.dart';

class FingerPage2 extends StatefulWidget {
  const FingerPage2({super.key});

  @override
  _FingerPage2State createState() => _FingerPage2State();
}

class _FingerPage2State extends State<FingerPage2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    // Настраиваем контроллер для анимации с продолжительностью 3 секунды
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true); // Повторяем анимацию с возвратом
    
    // Анимация плавного перехода от синего к красному
    _colorAnimation = ColorTween(
      begin: Color(0xFF0066B3),
      end: Color(0xFFEE2F53),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождаем ресурсы контроллера
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              // Возвращаем анимированную иконку
              return Icon(
                Icons.fingerprint, // Иконка отпечатка пальца
                size: 100,
                color: _colorAnimation.value, // Плавная смена цвета
              );
            },
          ),
          const SizedBox(height: 20), // Отступ между иконкой и текстом
          
          // Три подсказки
          const Text(
            'Положите палец на сканер\nещё раз',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
