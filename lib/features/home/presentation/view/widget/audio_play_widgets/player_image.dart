import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/assets_manager.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class PlayerImage extends StatelessWidget {
  const PlayerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.h,
        width: 150.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorManager.orange.withOpacity(0.4.sp),
                blurRadius: 25.sp,
                spreadRadius: 3.r,
                offset: const Offset(0, 5),
              ),
            ],
           ),
        child: ClipOval(
          child: Image.asset(
            ImageAssets.reciterImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
