// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../presentation/resources/routes_manager.dart';
// import '../presentation/resources/theme_manager.dart';
// import '../presentation/resources/font_manager.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// @immutable
// class MyApp extends StatefulWidget {
//   const MyApp._internal(); // private named constructor
//   final int appState = 0;
//   static MyApp instance =
//       const MyApp._internal(); // single instance -- singleton
//
//   factory MyApp() => instance; // factory for the class instance
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     FontConstants.setLocale(context.locale);
//     return ScreenUtilInit(
//       designSize: const Size(392.87, 852.09),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return MaterialApp(
//           navigatorKey: navigatorKey,
//           localizationsDelegates: context.localizationDelegates,
//           supportedLocales: context.supportedLocales,
//           locale: context.locale,
//           // prevent text scaling
//           builder: (context, widget) {
//             return MediaQuery(
//               data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
//               child: widget!,
//             );
//           },
//           debugShowCheckedModeBanner: false,
//           onGenerateRoute: RouteGenerator.getRoute,
//           initialRoute: Routes.splashRoute,
//           theme: getApplicationTheme(),
//           home: child,
//         );
//       },
//     );
//   }
// }
