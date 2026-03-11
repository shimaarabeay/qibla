import 'dart:ui';

class FontConstants {
  static const String montserrat = 'Montserrat';
  static const String nunito = 'Nunito';
  static const String graphikArabic = 'GraphikArabic';

  static bool _useArabic = false;

  static void setLocale(Locale locale) {
    _useArabic = locale.languageCode.toLowerCase() == 'ar';
  }

  static String get montserratFamily =>
      _useArabic ? graphikArabic : montserrat;
  static String get nunitoFamily =>
      _useArabic ? graphikArabic : nunito;
}


class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class FontSize {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s13 = 13.0;
  static const double s13_5 = 13.5;
  static const double s14 = 14.0;
  static const double s15 = 15.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s19 = 19.0;
  static const double s20 = 20.0;
  static const double s21 = 21.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
}
