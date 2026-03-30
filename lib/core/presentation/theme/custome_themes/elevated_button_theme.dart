import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';


class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.white,
      alignment: Alignment.center,
      elevation: 0,
      textStyle: getBoldMontserratStyle(
        color: ColorManager.black,
        fontSize: 16.sp,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      overlayColor: ColorManager.brandPrimarySoft,
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      overlayColor: ColorManager.darkPrimaryText.withValues(
        alpha: 0.12,
      ),
      backgroundColor: ColorManager.brown,
      alignment: Alignment.center,
      elevation: 0,
      textStyle: getBoldMontserratStyle(
        color: ColorManager.white,
        fontSize: 16.sp,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
  );
}
