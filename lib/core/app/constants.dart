import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';

class Constants {
  Constants._();
  static const String appName = 'Qibla';
  static const String en_Us = 'en_US';
  static const String ar_AE = 'ar_AE';
  static const String empty = '';
  static const int zero = 0;
  static const double zeroD = 0.0;
  static const  List<Color> lightBackgroundColors = [ColorManager.darkPrimaryColor,ColorManager.darkOrange,ColorManager.lightBrandPrimary];
  static const  List<Color>  darkBackgroundColors = [ColorManager.darkPrimaryColor,ColorManager.darkOrange,ColorManager.lightBrandPrimary];
  static const String bearer = 'Bearer ';
  static const Duration apiTimeOut = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);
  static const Duration timeDuration = Duration(seconds: 2);



}
