import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qibla/core/presentation/resources/routes_manager.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/core/presentation/theme/manager/theme_state.dart';
import 'package:qibla/core/presentation/theme/theme_app.dart';
import 'core/app/di.dart';
import 'core/app/services/notification_services.dart';
import 'features/home/presentation/manager/audio_cubit/audio_cubit.dart';
import 'features/home/presentation/manager/tasbeeh_cubit/tasbeeh_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await initAppModule();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission_______________: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(bgHandler);
  await NotificationService.init();
  FirebaseMessaging.onMessage.listen((message) {
    print("Message received----------------------------------------");
    final n = message.notification;
    if (n != null) {
      NotificationService.show(n.title ?? '', n.body ?? '');
    }
  });
  String? token = await messaging.getToken();
   print("TOKEN----------------------------------: $token");

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path:'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => instance<ThemeCubit>(),
            ),
            BlocProvider(
              create: (_) => instance<AudioCubit>(),
            ),
            BlocProvider(
              create: (_) => instance<TasbeehCubit>(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (BuildContext context, state) {
              return MaterialApp(debugShowMaterialGrid: false,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                theme: ThemeApp.lightTheme,
                darkTheme: ThemeApp.darkTheme,
                themeMode: state.themeMode,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splashRoute,
                onGenerateRoute: RouteGenerator.getRoute,
              );
            },
          ),
        );
      },
    );
  }
}
