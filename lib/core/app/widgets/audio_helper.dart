import '../constants.dart';

class AudioHelper {
  static String getAudioPath(int surah, int ayah) {
    final surahStr = surah.toString().padLeft(3, '0');
    final ayahStr = ayah.toString().padLeft(3, '0');
    return "${Constants.audioPath}$surahStr/$ayahStr.mp3";
  }
}