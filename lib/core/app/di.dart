import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:qibla/core/app/app_prefs.dart';
import 'package:qibla/core/data/network/dio_factory.dart';
import 'package:qibla/core/data/network/network_info.dart';
import 'package:qibla/core/presentation/theme/manager/theme_cubit.dart';
import 'package:qibla/features/settings/presentation/manager/settings_cubit.dart';
import 'package:qibla/features/splash_onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:qibla/features/splash_onboarding/presentation/view/onboarding_view.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // base dependencies
  const secureStorage = FlutterSecureStorage();
  instance.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);

  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance<FlutterSecureStorage>()),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(Connectivity()),
  );

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<Dio>(() => dio);

  instance.registerFactory<OnBoardingCubit>(
    () => OnBoardingCubit(),
  );
  instance.registerLazySingleton<SettingsCubit>(
        () => SettingsCubit(),
  );
  instance.registerFactory<ThemeCubit>(
        () => ThemeCubit(instance<AppPreferences>()),
  );
}

// void initLoginModule() {
//   if (GetIt.I.isRegistered<LoginUseCase>()) return;
//   instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//   instance.registerFactory<LoginCubit>(
//     () => LoginCubit(instance(), instance()),
//   );
// }

Future<void> resetModules() async {
  instance.reset(dispose: false);
  await initAppModule();
}
