import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:qibla/core/app/constants.dart';
import 'package:qibla/features/home/data/models/quran_read_model/surah_model.dart';
import 'package:qibla/features/home/domain/entity/surah_entity.dart';
import '../../domain/repositories/surah_repo.dart';

class SurahRepositoryImpl implements SurahRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentPlayingPath;

  final Map<int, Map<int, String>> _tafsirCache = {};

  @override
  Future<SurahEntity> getSurah(int surahNumber) async {
    try {
      final quranString = await rootBundle
          .loadString('${Constants.surahPath}$surahNumber.json');
      final Map<String, dynamic> quranJson = json.decode(quranString);
      final tafsirString = await rootBundle
          .loadString('${Constants.tafsirPath}$surahNumber.json');
      final Map<String, dynamic> tafsirJson = json.decode(tafsirString);
      _cacheTafsir(surahNumber, tafsirJson);
      return SurahModel.fromJson(quranJson, tafsirJson);
    } catch (e) {
      log('Error loading surah------------------------------------------------------------- $surahNumber: $e');
      print('Error loading surah $surahNumber: $e');
      throw Exception('فشل تحميل السورة');
    }
  }

  @override
  Future<List<int>> getAllSurahNumbers() async {
    final jsonString =
        await rootBundle.loadString('${Constants.allSurahsPath}.json');
    final List data = json.decode(jsonString);
    return data.map<int>((e) => e['number'] as int).toList();
  }

  void _cacheTafsir(int surahNumber, Map<String, dynamic> tafsirJson) {
    final tafsirMap = tafsirJson['verse'] as Map<String, dynamic>;

    _tafsirCache[surahNumber] = tafsirMap.map((key, value) {
      final ayahNumber = int.tryParse(key.split('_').last) ?? 0;
      return MapEntry(ayahNumber, value as String);
    });
  }

  @override
  Future<bool> playAyah(String audioPath) async {
    try {
      if (_currentPlayingPath == audioPath) {
        await _audioPlayer.stop();
        _currentPlayingPath = null;
        return false;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioPath));
      _currentPlayingPath = audioPath;
      return true;
    } catch (e) {
      print('Error playing audio: $e');
      return false;
    }
  }

  @override
  Future<String> getAyahTafsir(int surahNumber, int ayahNumber) async {
    return _tafsirCache[surahNumber]?[ayahNumber] ?? '';
  }
}
