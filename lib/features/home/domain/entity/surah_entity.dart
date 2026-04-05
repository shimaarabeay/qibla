
class SurahEntity {
  final String name;
  final Map<String, String> nameTranslations;
  final int numberOfAyah;
  final int numberOfSurah;
  final String place;
  final String recitation;
  final String type;

  SurahEntity({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitation,
    required this.type,
  });
}