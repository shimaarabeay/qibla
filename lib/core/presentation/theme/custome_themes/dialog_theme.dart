import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class CustomDialogTheme {
  CustomDialogTheme._();

  static DialogThemeData lightDialogTheme = DialogThemeData(
    backgroundColor: ColorManager.lightSurface,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.lightPrimaryText,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.lightSecondaryText,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    insetPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    elevation: 2,
  );

  static DialogThemeData darkDialogTheme = DialogThemeData(
    backgroundColor: ColorManager.darkCard,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.darkPrimaryText,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.darkSecondaryText,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    insetPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    elevation: 2,
  );
}
