
import 'package:hive/hive.dart';

import '../../domain/entity/surah_entity.dart';

part 'surah_model.g.dart';
@HiveType(typeId: 0)
class SurahModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Map<String, String> nameTranslations;

  @HiveField(2)
  final int numberOfAyah;

  @HiveField(3)
  final int numberOfSurah;

  @HiveField(4)
  final String place;

  @HiveField(5)
  final String recitation;

  @HiveField(6)
  final String type;

  SurahModel({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitation,
    required this.type,
  });

  /// From JSON
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      name: json['name'],
      nameTranslations: Map<String, String>.from(json['name_translations']),
      numberOfAyah: json['number_of_ayah'],
      numberOfSurah: json['number_of_surah'],
      place: json['place'],
      recitation: json['recitation'],
      type: json['type'],
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'name_translations': nameTranslations,
    'number_of_ayah': numberOfAyah,
    'number_of_surah': numberOfSurah,
    'place': place,
    'recitation': recitation,
    'type': type,
  };

  SurahEntity toEntity() {
    return SurahEntity(
      name: name,
      nameTranslations: nameTranslations,
      numberOfAyah: numberOfAyah,
      numberOfSurah: numberOfSurah,
      place: place,
      recitation: recitation,
      type: type,
    );
  }
}