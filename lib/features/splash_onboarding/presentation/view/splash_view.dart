import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    final color = Theme.of(context);
    return Scaffold(
      backgroundColor:  color.colorScheme.background,
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
                    Image.asset('assets/images/logo_background.png', width: 192.w,height: 128.h,),
                    Image.asset('assets/images/logo.png', width:128.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Text('القرآن الكريم', style: getNunitoStyle(
                  fontSize: 38.sp,
                  color: ColorManager.orange,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 60.w, child: Divider(color: ColorManager.liteOrange, thickness: 1)),
                    Text(' THE NOBLE QURAN ', style: getNunitoStyle(
                      fontSize: 14.sp,
                      color: ColorManager.orange,
                      letterSpacing: 4,
                    )),
                    SizedBox(width: 60.w, child: Divider(color: ColorManager.liteOrange, thickness: 1)),
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
