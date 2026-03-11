import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qibla/core/app/constants.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Constants.timeDuration,
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
    controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF6F2ED),
      body: FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/logo_background.png', width: screenWidth*0.6),
                    Image.asset('assets/images/logo.png', width: screenWidth*0.4),
                  ],
                ),
                const SizedBox(height: 20),
                Text('القرآن الكريم', style: getNunitoStyle(
                  fontSize: 38,
                  color: ColorManager.brown,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: screenWidth * 0.15, child: Divider(color: ColorManager.liteOrange, thickness: 1)),
                    Text(' THE NOBLE QURAN ', style: getNunitoStyle(
                      fontSize: 14,
                      color: ColorManager.liteOrange,
                      letterSpacing: 4,
                    )),
                    SizedBox(width: screenWidth * 0.15, child: Divider(color: ColorManager.liteOrange, thickness: 1)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
