import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

String getTafsir({
  required Map<String, dynamic> json,
  required int ayahNumber,
  required int surahNumber,
}) {
  final surahNum = json['$surahNumber'];
  final verseMap = json['verse'] as Map<String, dynamic>;

  final key = 'verse_$ayahNumber';

  return verseMap[key] ?? 'لا يوجد تفسير';
}


