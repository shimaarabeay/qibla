import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/font_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';


class OptionItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;

  const OptionItem({
    super.key,
    required this.title,
    this.icon,
    required this.isSelected,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.orange.withOpacity(0.12) : Colors.white70,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? ColorManager.orange : Colors.black,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon,color: isSelected ? ColorManager.orange : Colors.black,size: 20.sp,),
            SizedBox(height: 3.h),
            ],
            Text(
              title,
              style: getBoldStyle(color: isSelected ?ColorManager.orange : Colors.black,fontSize: FontSize.s18),
            ),
          ],
        ),
      ),
    );
  }
}
