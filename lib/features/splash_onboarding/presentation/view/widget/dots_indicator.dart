import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotsIndicator({super.key, required this.currentIndex, required this.count});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dotSize = screenWidth * 0.02;
    final activeWidth = screenWidth * 0.08;

    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin:  EdgeInsets.symmetric(horizontal: dotSize / 2),
          height: dotSize,
          width: currentIndex == index ? activeWidth : dotSize,
          decoration: BoxDecoration(
            color: currentIndex == index ? const Color(0xff8B6F61) : Colors.grey,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        ),
      ),
    );
  }
}