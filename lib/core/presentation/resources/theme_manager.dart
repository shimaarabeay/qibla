import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';
import 'package:qibla/core/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.baseColor,
    primaryColorLight: Colors.grey,
    disabledColor: Colors.grey,
    splashColor: ColorManager.coolGrey,
    scaffoldBackgroundColor: ColorManager.white,
    fontFamily: FontConstants.nunitoFamily,

    // /// card view theme
    cardTheme: CardThemeData(
      color: ColorManager.white3.withOpacity(.4),
      shadowColor: ColorManager.white3.withOpacity(.1),
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8.sp),
        side: BorderSide(
          color: ColorManager.coolGrey.withOpacity(.4),
          width: AppSize.s1,
        ),
      ),
    ),

    /// divider theme
    dividerTheme: DividerThemeData(
      endIndent: AppSize.s16,
      color: ColorManager.lightBlue,
      indent: AppSize.s16,
      space: AppSize.s16,
    ),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      //color: ColorManager.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: ColorManager.white,
      elevation: 0,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(AppSize.s32),
      //     // Adjust the radius as needed
      //     bottomLeft:
      //         Radius.circular(AppSize.s32), // Adjust the radius as needed
      //   ),
      // ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      titleTextStyle: getSemiBoldMontserratStyle(
        fontSize: FontSize.s18.sp,
        color: ColorManager.battleshipGrey,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.baseColor,
      buttonColor: ColorManager.baseColor,
      splashColor: Colors.blue,
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldNunitoStyle(
          color: ColorManager.white,
          fontSize: FontSize.s18.sp,
        ),
        backgroundColor: ColorManager.baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s02.sp),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldMontserratStyle(
        color: Colors.black,
        fontSize: FontSize.s16.sp,
      ),
      displayMedium: getSemiBoldMontserratStyle(
        color: Colors.black,
        fontSize: FontSize.s22.sp,
      ),
      displaySmall: getSemiBoldMontserratStyle(
        color: Colors.black,
        fontSize: FontSize.s24.sp,
      ),
      headlineMedium: getMediumNunitoStyle(
        color: ColorManager.warmGrey2,
        fontSize: FontSize.s18.sp,
      ),
      titleMedium: getRegularNunitoStyle(
        color: ColorManager.warmGrey2,
        fontSize: FontSize.s12.sp,
      ),
      titleSmall: getRegularNunitoStyle(
        color: Colors.black,
        fontSize: FontSize.s15.sp,
      ),
      bodySmall: getRegularNunitoStyle(color: Colors.grey),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showUnselectedLabels: true,
      selectedItemColor: ColorManager.vividRed,
      unselectedItemColor: ColorManager.cadetGrey,

      selectedLabelStyle: getBoldNunitoStyle(
        color: ColorManager.vividRed,
        fontSize: 13.sp,
      ),
      unselectedLabelStyle: getSemiBoldNunitoStyle(
        color: ColorManager.cadetGrey,
        fontSize: 12.sp,
      ),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.richBlack,
      filled: true,
      prefixIconColor: ColorManager.baseColor,
      suffixIconColor: ColorManager.coolGrey,
      hoverColor: ColorManager.baseColor,

      /// content padding
      contentPadding: EdgeInsets.all(16.w),
      counterStyle: getRegularNunitoStyle(
        color: ColorManager.baseColor,
        fontSize: AppSize.s18.sp,
      ),
      floatingLabelStyle: getRegularNunitoStyle(
        color: ColorManager.baseColor,
        fontSize: AppSize.s18.sp,
      ),
      hintStyle: getRegularNunitoStyle(
        color: ColorManager.slateGray,
        fontSize: AppSize.s16.sp,
      ),
      labelStyle: getRegularNunitoStyle(
        color: ColorManager.white,
        fontSize: AppSize.s18.sp,
      ),
      errorStyle: getRegularNunitoStyle(color: ColorManager.primaryRed),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.charcoalGrey,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.slateGray,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primaryRed, width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.charcoalGrey,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.charcoalGrey,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s10.r)),
      ),
    ),
  );
}
