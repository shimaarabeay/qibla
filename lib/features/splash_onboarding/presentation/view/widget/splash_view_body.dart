import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/resources/color_manager.dart';
import '../../../../../core/presentation/resources/styles_manager.dart';

class SplashViewBody extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const SplashViewBody({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
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
                  Image.asset(
                    'assets/images/logo_background.png',
                    width: 192.w,
                    height: 128.h,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 128.w,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
               'app.quran'.tr(),
                style: getNunitoStyle(
                  fontSize: 38.sp,
                  color: ColorManager.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    child:
                        Divider(color: ColorManager.liteOrange, thickness: 1),
                  ),
                  Text(
                    'THE NOBLE QURAN ',
                    style: getNunitoStyle(
                      fontSize: 14.sp,
                      color: ColorManager.orange,
                      letterSpacing: 4,
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                    child:
                        Divider(color: ColorManager.liteOrange, thickness: 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
