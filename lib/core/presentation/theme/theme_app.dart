import 'package:flutter/material.dart';
import 'package:qibla/core/app/constants.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/theme/custome_themes/app_bar_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/bottom_navigation_bar_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/bottom_sheet_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/card_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/dialog_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/elevated_button_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/gradient_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/input_decoration_theme.dart';
import 'package:qibla/core/presentation/theme/custome_themes/text_theme.dart';


class ThemeApp {
  ThemeApp._();

  static final ThemeData lightTheme = _buildTheme(

    brightness: Brightness.light,
    appBarTheme: CustomAppBarTheme.light,
    scaffoldBackgroundColor: ColorManager.lightBackground,
    highlightColor: ColorManager.lightSurfaceAlt,
    disabledColor: ColorManager.lightFocusedSurfaceAlt,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    cardTheme: CustomCardTheme.lightCardTheme,
    inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
    dialogTheme: CustomDialogTheme.lightDialogTheme,
    textTheme: CustomTextAppTheme.lightTextTheme,
    bottomNavigationBarTheme: CustomBottomNavTheme.lightBottomNavTheme,
    colorScheme:  ColorScheme(
      background: ColorManager.white,
      brightness: Brightness.light,
      primary: ColorManager.orange,
      onPrimary: ColorManager.white,
      secondary: ColorManager.black,
      onSecondary: ColorManager.white,
      error: ColorManager.red,
      onError: ColorManager.white,
      surface: ColorManager.lightSurface,
      onSurface: ColorManager.lightBrandPrimary.withOpacity(0.12),
    ),
    gradientColors: Constants.lightBackgroundColors,
  );

  static final ThemeData darkTheme = _buildTheme(

    brightness: Brightness.dark,
    appBarTheme: CustomAppBarTheme.dark,
    scaffoldBackgroundColor: ColorManager.darkBackground,
    highlightColor: ColorManager.darkBorder,
    disabledColor: ColorManager.darkSurfaceAlt,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    cardTheme: CustomCardTheme.darkCardTheme,
    inputDecorationTheme: CustomInputDecorationTheme.darkInputDecorationTheme,
    dialogTheme: CustomDialogTheme.darkDialogTheme,
    textTheme: CustomTextAppTheme.darkTextTheme,
    bottomNavigationBarTheme: CustomBottomNavTheme.darkBottomNavTheme,
    colorScheme:  ColorScheme(
      background: ColorManager.brown,
      brightness: Brightness.dark,
      primary: ColorManager.orange,
      onPrimary: ColorManager.darkBackground,
      secondary: ColorManager.white,
      onSecondary: ColorManager.darkPrimaryText,
      error: ColorManager.red221,
      onError: ColorManager.darkPrimaryText,
      surface: ColorManager.darkSurface,
      onSurface: ColorManager.darkPrimaryText,
    ),
  gradientColors: Constants.darkBackgroundColors,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppBarTheme appBarTheme,
    required Color scaffoldBackgroundColor,
    required Color highlightColor,
    required Color disabledColor,
    required ElevatedButtonThemeData elevatedButtonTheme,
    required BottomSheetThemeData bottomSheetTheme,
    required CardThemeData cardTheme,
    required InputDecorationTheme inputDecorationTheme,
    required DialogThemeData dialogTheme,
    required TextTheme textTheme,
    required BottomNavigationBarThemeData bottomNavigationBarTheme,
    required ColorScheme colorScheme,
    required List<Color> gradientColors,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      highlightColor: highlightColor,
      splashColor: highlightColor.withValues(alpha: 0.18),
      disabledColor: disabledColor,
      dividerColor: disabledColor,
      colorScheme: colorScheme,
      elevatedButtonTheme: elevatedButtonTheme,
      bottomSheetTheme: bottomSheetTheme,
      cardTheme: cardTheme,
      inputDecorationTheme: inputDecorationTheme,
      dialogTheme: dialogTheme,
      textTheme: textTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      extensions: [
        AppGradientTheme(
          newBackground: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.2, 0.3, 0.7, 1.0],
          ),
        ),
      ],
    );
  }
}
