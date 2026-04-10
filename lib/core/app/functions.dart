import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/app/app_prefs.dart';
import 'package:qibla/core/app/auth_model_storage.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/locale_keys.dart';
import 'dart:convert';

SizedBox verticalSpace(double value) => SizedBox(height: value.h);

SizedBox horizontalSpace(double value) => SizedBox(width: value.w);

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.emailRequired.tr();
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return LocaleKeys.invalidEmail.tr();
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.passwordRequired.tr();
  }
  if (value.length < 6) {
    return LocaleKeys.passwordTooShort.tr();
  }
  return null;
}

String? fullNameValidator(String? value) {
  final name = value?.trim() ?? '';

  if (name.isEmpty) {
    return LocaleKeys.fullNameRequired.tr();
  }

  final parts = name.split(' ').where((p) => p.isNotEmpty).toList();

  if (parts.length < 2) {
    return LocaleKeys.fullNameTwoParts.tr();
  }

  if (parts.any((p) => p.length < 2)) {
    return LocaleKeys.fullNameEachPartMinLength.tr();
  }

  return null;
}

String? egyptianPhoneValidator(String? value) {
  final phone = value?.trim() ?? '';

  if (phone.isEmpty) {
    return LocaleKeys.phoneRequired.tr();
  }

  if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
    return LocaleKeys.phoneDigitsOnly.tr();
  }

  if (phone.length != 11) {
    return LocaleKeys.phoneLength.tr();
  }

  if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(phone)) {
    return LocaleKeys.phoneInvalidEgyptian.tr();
  }

  return null;
}

String? confirmPasswordValidator(String? value, String originalPassword) {
  final confirmPassword = value?.trim() ?? '';
  final pw = originalPassword.trim();

  if (confirmPassword.isEmpty) {
    return LocaleKeys.confirmPasswordRequired.tr();
  }

  if (confirmPassword != pw) {
    return LocaleKeys.passwordsNotMatch.tr();
  }

  return null;
}

String? amountValidator(String? value) {
  final val = value?.trim() ?? '';

  if (val.isEmpty) {
    return LocaleKeys.amountInvalid.tr();
  }


  return null;
}



String getName(String ar, String en, BuildContext context) {
  String selectedName = isCurrentLanguageEn(context) ? en : ar;
  return selectedName;
}
bool isCurrentLanguageEn(BuildContext context) {
  return EasyLocalization.of(context)!.locale.languageCode == 'en'
      ? true
      : false;
}

String formatDateTime(String date, BuildContext context) {
  if (date.isEmpty) {
    return '';
  }
  DateTime dateTime = DateTime.parse(date);

  DateFormat dateFormat =
  DateFormat('MMM dd, yyyy', context.locale.languageCode);

  String formattedDateTime = dateFormat.format(dateTime);

  return formattedDateTime;
}

String formatMinutesToHours(int totalMinutes) {
  final hoursShort = 'common.time.hoursShort'.tr();
  final minutesShort = 'common.time.minutesShort'.tr();
  final separator = 'common.time.separator'.tr();

  if (totalMinutes < 60) {
    return '$totalMinutes $minutesShort';
  }

  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  if (minutes == 0) {
    return '$hours $hoursShort';
  }

  final hourText = '$hours $hoursShort';
  return '$hourText$separator$minutes $minutesShort';
}

Future<void> openSocialLink(String url) async {
  final uri = Uri.parse(url);
  final launched = await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
  if (!launched && kDebugMode) {
    debugPrint('Could not launch $url');
  }
}

bool detectTextLanguageIsEnMore(String text) {
  final arabicCount =
      RegExp(r'[\u0600-\u06FF]').allMatches(text).length;

  final englishCount =
      RegExp(r'[A-Za-z]').allMatches(text).length;

  return englishCount > arabicCount;
}

void setStatusBarWhiteIcons() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      // ✅ ANDROID → white icons
      statusBarIconBrightness: Brightness.light,

      // ✅ iOS → white icons
      statusBarBrightness: Brightness.dark,
    ),
  );
}
