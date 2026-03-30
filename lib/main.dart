import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/app/functions.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/core/presentation/theme/manager/theme_state.dart';
import 'package:qibla/core/presentation/theme/theme_app.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/onboarding_view.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/splash_view.dart';
import 'core/app/di.dart';
import 'core/app/app_prefs.dart';
import 'core/presentation/resources/language_manager.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//
//   await initAppModule();
//   final savedLocale = await instance<AppPreferences>().getLocal();
//
//   FlutterError.onError = (errorDetails) {
//     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//   };
//
//   PlatformDispatcher.instance.onError = (error, stack) {
//     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     return true;
//   };
//   setStatusBarWhiteIcons();
//   runApp(
//     // MyApp()
//
//     EasyLocalization(
//       supportedLocales: [ARABIC_LOCAL, ENGLISH_LOCAL],
//       path: ASSTET_PATH_LOCALISATION,
//       fallbackLocale: ENGLISH_LOCAL,
//       startLocale: savedLocale,
//       saveLocale: true,
//       child: MyApp(),
//     ),
//   );
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute:Routes.splashRoute,
//       onGenerateRoute: RouteGenerator.getRoute,
//     );
//   }
// }



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  final savedLocale = await instance<AppPreferences>().getLocal();

  runApp(
     MyApp()

  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => instance<ThemeCubit>(),
          child: BlocBuilder<ThemeCubit,ThemeState>(
            builder: (BuildContext context, state) =>
             MaterialApp(
              theme:ThemeApp.lightTheme ,
               darkTheme:ThemeApp.darkTheme ,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splashRoute,
              onGenerateRoute: RouteGenerator.getRoute,
            ),
          ),
        );
      },
    );
  }
}