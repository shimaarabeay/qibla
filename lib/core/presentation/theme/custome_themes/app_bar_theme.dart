import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';


class CustomAppBarTheme {
  CustomAppBarTheme._();



  static AppBarTheme light = AppBarTheme(
  surfaceTintColor: ColorManager.primaryColor,
    backgroundColor: ColorManager.primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorManager.white),
    titleTextStyle: getRegularGeneralStyle(
      color: ColorManager.white,
      fontSize: 20.sp,
    ),
    centerTitle: true,
  );

  static AppBarTheme dark = AppBarTheme(
   surfaceTintColor: ColorManager.streakOrange,
    backgroundColor: ColorManager.streakOrange,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorManager.black),
    titleTextStyle:  getRegularGeneralStyle(
      color: ColorManager.black,
      fontSize: 20.sp,
    ),
    centerTitle: true,
  );
}
