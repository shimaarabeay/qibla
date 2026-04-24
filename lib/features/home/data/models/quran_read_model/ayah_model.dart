import 'package:qibla/core/app/widgets/audio_helper.dart';
import 'package:qibla/features/home/domain/entity/ayah_entity.dart';

class AyahModel extends AyahEntity {
  AyahModel({
    required super.surahNumber,
    required super.ayahNumber,
    required super.text,
    required super.audioPath,
    required super.tafsir,
  });

  factory AyahModel.fromMap({
    required String ayaNumber,
    required String text,
    required int surahNumber,
    required String tafsir,
  }) {
    final ayahNumber = int.tryParse(ayaNumber.split('_').last) ?? 0;
    return AyahModel(
        ayahNumber: ayahNumber,
        text: text,
        surahNumber: surahNumber,
        audioPath: AudioHelper.getAudioPath(surahNumber, ayahNumber),
        tafsir: tafsir);
  }
}
