String getTafsir({
  required Map<String, dynamic> json,
  required int ayahNumber,
  required int surahNumber,
}) {
  final  surahNum= json['$surahNumber'];
  final verseMap = json['verse'] as Map<String, dynamic>;

  final key = 'verse_$ayahNumber';

  return verseMap[key] ?? 'لا يوجد تفسير';
}