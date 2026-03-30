import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/splash_onboarding/domain/models/onboarding_model.dart';

class SliderItem extends StatelessWidget {
  final SliderObject slider; // SliderObject

  const SliderItem({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 380.h,
          width: 360.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  slider.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),


              if (slider.overlayWidget != null) slider.overlayWidget!,
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          slider.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.orange),
        ),
        SizedBox(height:10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            slider.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}
