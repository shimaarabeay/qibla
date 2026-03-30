import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class CustomBottomNavTheme {
  CustomBottomNavTheme._();

  static BottomNavigationBarThemeData lightBottomNavTheme =
  BottomNavigationBarThemeData(
    backgroundColor: ColorManager.white,
    selectedItemColor: ColorManager.orange,
    unselectedItemColor: ColorManager.gray,
    elevation: 0,
    unselectedIconTheme: IconThemeData(
      size: 20.sp,
      color: ColorManager.coolGrey,
    ),
    selectedIconTheme: IconThemeData(
      size: 20.sp,
      color: ColorManager.gray,
    ),
    selectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.orange,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: ColorManager.gray,
    ),
  );

  static BottomNavigationBarThemeData darkBottomNavTheme =
  BottomNavigationBarThemeData(
    backgroundColor: ColorManager.brown,
    selectedItemColor: ColorManager.orange,
    unselectedItemColor: ColorManager.white,
    elevation: 0,
    unselectedIconTheme: IconThemeData(
      size: 20.sp,
      color: ColorManager.white,
    ),
    selectedIconTheme: IconThemeData(
      size: 20.sp,
      color: ColorManager.orange,
    ),
    selectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: ColorManager.orange,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: ColorManager.white,
    ),
  );
}
