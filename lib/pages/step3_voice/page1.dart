import 'package:flutter/material.dart';

class VoicePage1 extends StatefulWidget {
  const VoicePage1({super.key});

  @override
  _VoicePage1State createState() => _VoicePage1State();
}

class _VoicePage1State extends State<VoicePage1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    // Настраиваем контроллер для анимации с продолжительностью 2 секунды
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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
                Icons.mic, // Иконка микрофона
                size: 100,
                color: _colorAnimation.value, // Плавная смена цвета
              );
            },
          ),
          const SizedBox(height: 20), // Отступ между иконкой и текстом
          
          // Три подсказки
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black), // Общий стиль для всего текста
              children: [
                TextSpan(
                  text: 'Громко и четко произнесите следующие цифры:\n\n', // Обычный текст
                ),
                TextSpan(
                  text: '2 8 1 4 6 7', // Жирный текст
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
