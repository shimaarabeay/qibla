import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.regular,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: FontConstants.montserratFamily,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
  );
}

TextStyle getLightMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.light,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getRegularMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getMediumMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.medium,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getSemiBoldMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.semiBold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getBoldMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getExtraBoldMontserratStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.extraBold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );



/// دالة عامة مرنة — استعملها في أي مكان (Nunito)
TextStyle getNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.regular,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: FontConstants.montserrat,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
  );
}

/// دوال مختصرة (نفس اللي كان لتجوال بس على Nunito)

TextStyle getLightNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.light,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getRegularNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getMediumNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.medium,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getSemiBoldNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.semiBold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getBoldNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getExtraBoldNunitoStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    getNunitoStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.extraBold,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

TextStyle getRegularStyle({
  double fontSize = FontSize.s30,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) =>
    _getMontserratStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.light,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );