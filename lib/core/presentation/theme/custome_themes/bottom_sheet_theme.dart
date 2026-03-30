import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class CustomBottomSheetTheme {
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: ColorManager.lightSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    elevation: 0,
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: ColorManager.darkSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    elevation: 0,
  );
}
