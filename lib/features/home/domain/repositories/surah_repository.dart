import '../entity/surah_entity.dart';

abstract class SurahRepository {
  Future<List<SurahEntity>> getAllSurahs({bool forceRefresh = false});
}