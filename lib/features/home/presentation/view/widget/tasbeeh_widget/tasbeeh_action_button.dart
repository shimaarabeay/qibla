import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/presentation/resources/color_manager.dart';
class TasbeehActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const TasbeehActionButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.all(20.r),
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color:ColorManager.orange,
        ),
        child:  Icon(
          Icons.touch_app,
          size: 50.sp,
          color: ColorManager.white,
        ),
      ),
    );
  }
}