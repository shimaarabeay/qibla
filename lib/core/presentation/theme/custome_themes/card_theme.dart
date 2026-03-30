import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class CustomCardTheme {
  CustomCardTheme._();

  static CardThemeData lightCardTheme = CardThemeData(
    elevation: 3,
    color: ColorManager.lightCard,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    elevation: 3,
    color: ColorManager.darkCard,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );
}
