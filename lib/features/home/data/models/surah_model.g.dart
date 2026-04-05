// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahModelAdapter extends TypeAdapter<SurahModel> {
  @override
  final int typeId = 0;

  @override
  SurahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahModel(
      name: fields[0] as String,
      nameTranslations: (fields[1] as Map).cast<String, String>(),
      numberOfAyah: fields[2] as int,
      numberOfSurah: fields[3] as int,
      place: fields[4] as String,
      recitation: fields[5] as String,
      type: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurahModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nameTranslations)
      ..writeByte(2)
      ..write(obj.numberOfAyah)
      ..writeByte(3)
      ..write(obj.numberOfSurah)
      ..writeByte(4)
      ..write(obj.place)
      ..writeByte(5)
      ..write(obj.recitation)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
