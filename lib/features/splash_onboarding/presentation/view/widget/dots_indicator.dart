import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotsIndicator({super.key, required this.currentIndex, required this.count});

  @override
  Widget build(BuildContext context) {


   final double  inActiveDotWidth =8.w;
   final double  activeDotWidth =34.w;
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin:  EdgeInsets.symmetric(horizontal: 4.w),
          height:8.h,
          width: currentIndex == index ? activeDotWidth : inActiveDotWidth,
          decoration: BoxDecoration(
            color: currentIndex == index ? ColorManager.orange : ColorManager.gray,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}