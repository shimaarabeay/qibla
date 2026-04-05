import '../../../domain/entity/surah_entity.dart';

abstract class SurahState {}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahError extends SurahState {
  final String message;
  SurahError(this.message);
}

class SurahPlayerState extends SurahState {
  final List<SurahEntity> surahs;
  final int currentIndex;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration duration;

  SurahPlayerState({
    required this.surahs,
    required this.currentIndex,
    required this.isPlaying,
    required this.currentPosition,
    required this.duration,
  });

  SurahPlayerState copyWith({
    List<SurahEntity>? surahs,
    int? currentIndex,
    bool? isPlaying,
    Duration? currentPosition,
    Duration? duration,
  }) {
    return SurahPlayerState(
      surahs: surahs ?? this.surahs,
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      duration: duration ?? this.duration,
    );
  }
}