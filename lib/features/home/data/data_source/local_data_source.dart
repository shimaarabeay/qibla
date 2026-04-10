import 'package:qibla/core/app/constants.dart';

import '../../../../core/app/services/hive_service.dart';
import '../models/audio_model/audio_model.dart';

abstract class AudioLocalDataSource {
  Future<void> cacheSurahs(List<AudioModel> surahs);

  List<AudioModel> getCachedSurahs();

  Future<void> clearCache();
}


class AudioLocalDataSourceImpl implements AudioLocalDataSource {
  final HiveService<AudioModel> hiveService;

  AudioLocalDataSourceImpl({required this.hiveService});


  @override
  Future<void> cacheSurahs(List<AudioModel> surahs) async {
    await hiveService.openBox(boxName: Constants.surahBox);
    await hiveService.clearBox(boxName: Constants.surahBox);
    await hiveService.addAll(boxName:  Constants.surahBox, items: surahs);
  }

  @override
  List<AudioModel> getCachedSurahs() {
    return hiveService.getAll(boxName: Constants.surahBox);
  }

  @override
  Future<void> clearCache() async {
    await hiveService.clearBox(boxName:  Constants.surahBox);
  }
}
