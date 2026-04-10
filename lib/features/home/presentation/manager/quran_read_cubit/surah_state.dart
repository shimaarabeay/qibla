import 'package:equatable/equatable.dart';
import '../../../domain/entity/surah_entity.dart';

enum SurahStatus { initial, loading, loaded, error }

class SurahState extends Equatable {
  final SurahStatus status;
  final SurahEntity? surah;
  final String errorMessage;
  final int? playingAyahIndex;

  final List<int> surahNumbers;
  const SurahState({
    this.status = SurahStatus.initial,
    this.surah,
    this.errorMessage = '',
    this.playingAyahIndex,
    this.surahNumbers = const [], // default
  });

  SurahState copyWith({
    SurahStatus? status,
    SurahEntity? surah,
    String? errorMessage,
    int? playingAyahIndex,
    List<int>? surahNumbers,
  }) {
    return SurahState(
      status: status ?? this.status,
      surah: surah ?? this.surah,
      errorMessage: errorMessage ?? this.errorMessage,
      playingAyahIndex: playingAyahIndex,
      surahNumbers: surahNumbers ?? this.surahNumbers,
    );
  }

  @override
  List<Object?> get props => [
    status,
    surah,
    errorMessage,
    playingAyahIndex,
    surahNumbers,
  ];
}