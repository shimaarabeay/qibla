import 'ayah_entity.dart';

class SurahEntity {
  final int surahNumber;
  final String name;
  final List<AyahEntity> ayahs;

  SurahEntity({
    required this.surahNumber,
    required this.name,
    required this.ayahs,
  });
}