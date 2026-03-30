import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

class CustomTextAppTheme {
  CustomTextAppTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: getBoldMontserratStyle(
      color: ColorManager.primaryColor,
      fontSize: 35.sp,
    ),
    displayMedium: getBoldMontserratStyle(
      color: ColorManager.primaryColor,
      fontSize: 28.sp,
    ),
    displaySmall: getSemiBoldMontserratStyle(
      color: ColorManager.primaryColor,
      fontSize: 24.sp,
    ),
    headlineMedium: getRegularStyle(
      color: ColorManager.secondaryGrey,
      fontSize: 16.sp,
    ),
    headlineSmall: getRegularStyle(
      color: ColorManager.lightPrimaryColor,
      fontSize: 18.sp,
    ),
    titleLarge: getBoldMontserratStyle(
      color: ColorManager.white,
      fontSize: 20.sp,
    ),
    titleMedium: getBoldMontserratStyle(
      color: ColorManager.white,
      fontSize: 18.sp,
    ),
    titleSmall: getMediumMontserratStyle(
      color: ColorManager.secondaryGrey,
      fontSize: 16.sp,
    ),
    bodyLarge: getRegularStyle(
      color: ColorManager.primaryColor,
      fontSize: 16.sp,
      height: 1.4,
    ),
    bodyMedium: getRegularStyle(
      color: ColorManager.primaryColor,
      fontSize: 14.sp,
      height: 1.4,
    ),

    bodySmall: getRegularStyle(
      color: ColorManager.grayDark,
      fontSize: 16.sp,
    ),
    // selected
    labelLarge: getBoldMontserratStyle(
      color: ColorManager.orange,
      fontSize: 16.sp,
    ),
    //unSelected
    labelMedium: getRegularStyle(
      color: ColorManager.grayDark,
      fontSize: 16.sp,
    ),
    labelSmall: getRegularStyle(
      color: ColorManager.darkOrange,
      fontSize: 11.sp,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: getBoldMontserratStyle(
      color: ColorManager.darkPrimaryColor,
      fontSize: 35.sp,
    ),
    displayMedium: getBoldMontserratStyle(
      color: ColorManager.darkPrimaryColor,
      fontSize: 28.sp,
    ),
    displaySmall: getSemiBoldMontserratStyle(
      color: ColorManager.darkPrimaryColor,
      fontSize: 24.sp,
    ),
    headlineMedium: getRegularStyle(
      color: ColorManager.darkPrimaryColor,
      fontSize: 16.sp,
    ),
    headlineSmall: getRegularStyle(
      color: ColorManager.darkPrimaryColor,
      fontSize: 18.sp,
    ),
    titleLarge: getBoldMontserratStyle(
      color: ColorManager.white,
      fontSize: 16.sp,
    ),
    titleMedium: getBoldMontserratStyle(
      color: ColorManager.white,
      fontSize: 18.sp,
    ),
    titleSmall: getMediumMontserratStyle(
      color: ColorManager.secondaryGrey,
      fontSize: 16.sp,
    ),
    bodyLarge: getRegularStyle(
      color: ColorManager.primaryColor,
      fontSize: 16.sp,
      height: 1.4,
    ),
    bodyMedium: getRegularStyle(
      color: ColorManager.primaryColor,
      fontSize: 14.sp,
      height: 1.4,
    ),

    bodySmall: getBoldMontserratStyle(
      color: ColorManager.white,
    ),
    //selected
    labelLarge: getBoldMontserratStyle(
      color: ColorManager.orange,
      fontSize: 16.sp,
    ),
    //unselected
    labelMedium: getBoldMontserratStyle(
      color: ColorManager.white,
      fontSize: 12.sp,
    ),
    labelSmall: getRegularStyle(
      color: ColorManager.darkOrange,
      fontSize: 11.sp,
    ),
  );
}
