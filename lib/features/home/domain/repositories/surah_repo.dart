
import 'package:qibla/features/home/domain/entity/surah_entity.dart';


abstract class SurahRepository {
  Future<SurahEntity> getSurah(int surahNumber);
  Future<bool> playAyah(String audioPath);
  Future<String> getAyahTafsir(int surahNumber, int ayahNumber);
  Future<List<int>> getAllSurahNumbers();

}