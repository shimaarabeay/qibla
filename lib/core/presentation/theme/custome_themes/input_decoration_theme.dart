import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorManager.lightSurface,

    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.lightBorder, width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.lightFocusedBorder, width: 1.4),
      borderRadius: BorderRadius.circular(16),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.red, width: 1),
      borderRadius: BorderRadius.circular(9),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.transparent, width: 1.3),
      borderRadius: BorderRadius.circular(9),
    ),

    labelStyle: TextStyle(
      color: ColorManager.lightSecondaryText,
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: TextStyle(
      color: ColorManager.lightPrimaryColor,
      fontSize: 9.sp,
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      color: ColorManager.lightSecondaryText,
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),

    prefixIconColor: ColorManager.lightSecondaryText,
    suffixIconColor: ColorManager.lightSecondaryText,

    errorMaxLines: 2,
    errorStyle: TextStyle(color: ColorManager.red, fontSize: 8.sp),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorManager.darkSurface,

    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.darkBorder, width: 1),
      borderRadius: BorderRadius.circular(9),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.darkAccent, width: 1.4),
      borderRadius: BorderRadius.circular(9),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.red, width: 1),
      borderRadius: BorderRadius.circular(9),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.red, width: 1.3),
      borderRadius: BorderRadius.circular(9),
    ),

    labelStyle: TextStyle(
      color: ColorManager.darkSecondaryText,
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: TextStyle(
      color: ColorManager.darkAccent,
      fontSize: 9.sp,
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      color: ColorManager.darkSecondaryText,
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),

    prefixIconColor: ColorManager.darkSecondaryText,
    suffixIconColor: ColorManager.darkSecondaryText,

    errorMaxLines: 2,
    errorStyle: TextStyle(color: ColorManager.red221, fontSize: 8.sp),
  );
}
