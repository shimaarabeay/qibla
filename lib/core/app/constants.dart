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
  static const String jsonFilePath = 'assets/json/quran.json';
  static const String surahBox = 'surah_box';
  static const String audioPath = "assets/quran_master/audio/";
  static const String surahPath = "assets/quran_master/surah/surah_";
  static const String allSurahsPath = "assets/quran_master/surah/";
  static const String tafsirPath = 'assets/quran_master/translation/ar/ar_translation_';



}
