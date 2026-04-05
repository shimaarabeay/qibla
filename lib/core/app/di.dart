
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qibla/core/app/services/hive_service.dart';
import 'package:qibla/core/app/services/hive_service_impl.dart';

import '../../features/home/data/data_source/remote_data_source.dart';
import '../../features/home/data/data_source/surah_local_data_source.dart';
import '../../features/home/data/models/surah_model.dart';
import '../../features/home/data/repositories/surah_repository_impl.dart';
import '../../features/home/domain/repositories/surah_repository.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../../features/splash_onboarding/presentation/manager/on_boarding_cubit.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../presentation/theme/manager/theme_cubit.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Hive.initFlutter();

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
  instance.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
  instance.registerFactory<ThemeCubit>(
      () => ThemeCubit(instance<AppPreferences>()));
//----------------------------Surah_______________________________
  Hive.registerAdapter(SurahModelAdapter());

// ================= Hive =================
  instance.registerLazySingleton<HiveService<SurahModel>>(
        () => HiveServiceImpl<SurahModel>(),
  );

// ================= Local =================
  instance.registerLazySingleton<SurahLocalDataSource>(
        () => SurahLocalDataSourceImpl(
      hiveService: instance<HiveService<SurahModel>>(),
    ),
  );

// ================= Remote =================
  instance.registerLazySingleton<SurahRemoteDataSource>(
        () => SurahRemoteDataSourceImpl(),
  );

// ================= Repository =================
  instance.registerLazySingleton<SurahRepository>(
        () => SurahRepositoryImpl(
      localDataSource: instance<SurahLocalDataSource>(),
      remoteDataSource: instance<SurahRemoteDataSource>(),
    ),
  );
}

void initOnBoardingModule() {
  if (!GetIt.I.isRegistered<OnBoardingCubit>()) {
    instance.registerFactory<OnBoardingCubit>(
      () => OnBoardingCubit(),
    );
  }
}

Future<void> resetModules() async {
  instance.reset(dispose: false);
  await initAppModule();
}
