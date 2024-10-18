import 'package:flutter/material.dart';
import 'dart:math';

class FingerPage3 extends StatefulWidget {
  const FingerPage3({super.key});

  @override
  _FingerPage3State createState() => _FingerPage3State();
}

class _FingerPage3State extends State<FingerPage3> with SingleTickerProviderStateMixin {
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
            'Прикладывайте палец на сканер,\nпока иконка не станет красной',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
