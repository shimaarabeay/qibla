import 'package:qibla/core/app/constants.dart';

import '../../../../core/app/services/hive_service.dart';
import '../models/surah_model.dart';

abstract class SurahLocalDataSource {
  Future<void> cacheSurahs(List<SurahModel> surahs);

  List<SurahModel> getCachedSurahs();

  Future<void> clearCache();
}


class SurahLocalDataSourceImpl implements SurahLocalDataSource {
  final HiveService<SurahModel> hiveService;

  SurahLocalDataSourceImpl({required this.hiveService});


  @override
  Future<void> cacheSurahs(List<SurahModel> surahs) async {
    await hiveService.openBox(boxName: Constants.surahBox);
    await hiveService.clearBox(boxName: Constants.surahBox);
    await hiveService.addAll(boxName:  Constants.surahBox, items: surahs);
  }

  @override
  List<SurahModel> getCachedSurahs() {
    return hiveService.getAll(boxName: Constants.surahBox);
  }

  @override
  Future<void> clearCache() async {
    await hiveService.clearBox(boxName:  Constants.surahBox);
  }
}
