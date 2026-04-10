import '../../../domain/entity/audio_entity.dart';

abstract class AudioState {}

class SurahInitial extends AudioState {}

class SurahLoading extends AudioState {}

class SurahError extends AudioState{
  final String message;
  SurahError(this.message);
}

class SurahPlayerState extends AudioState {
  final List<AudioEntity> surahs;
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
    List<AudioEntity>? surahs,
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