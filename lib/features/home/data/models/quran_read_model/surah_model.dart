import 'ayah_model.dart';
import '../../../domain/entity/surah_entity.dart';

class SurahModel extends SurahEntity {
  SurahModel({
    required super.surahNumber,
    required super.name,
    required List<AyahModel> super.ayahs,
  });

  factory SurahModel.fromJson(
    Map<String, dynamic> quranJson,
    Map<String, dynamic> tafsirJson,
  )
  {
    final index = quranJson['index'];
    final surahNumber = index is String ? int.parse(index) : index;
    final surahName = quranJson['name'] ?? '';
    final quranMap = quranJson['verse'] as Map<String, dynamic>;

    final tafsirMap = tafsirJson['verse'] as Map<String, dynamic>;
    final ayahs = quranMap.entries.map((e) {
      final ayahNumber = int.tryParse(e.key.split('_').last) ?? 0;
      final tafsir = tafsirMap['verse_$ayahNumber'] ?? '';
      return AyahModel.fromMap(
       ayaNumber: e.key,
        text: e.value,
        surahNumber: surahNumber,
        tafsir: tafsir,
      );
    }).toList();

    return SurahModel(
      surahNumber: surahNumber,
      name: surahName,
      ayahs: ayahs,
    );
  }
}
