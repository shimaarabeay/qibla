import 'package:flutter/material.dart';
import 'package:qibla/core/app/app.dart';
import 'package:qibla/core/app/app_prefs.dart';
import 'package:qibla/core/app/di.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';


class LogoutService {
  LogoutService._();

  static final AppPreferences appPrefs = instance<AppPreferences>();

  static Future<void> logout(BuildContext context) async {
    await appPrefs.logout();

    // // clear in-memory caches
    // instance<InCachePaymentLocalDataSource>().clearAll();
    // instance<InCacheClassesLocalDataSource>().clearAll();


    if (!context.mounted) return;

    final navigator =
        navigatorKey.currentState ?? Navigator.of(context, rootNavigator: true);

    // navigator.pushNamedAndRemoveUntil(
    //   Routes.loginRoute,
    //   (route) => false,
    // );
  }
}
