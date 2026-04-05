import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/entity/surah_entity.dart';
import '../../../domain/repositories/surah_repository.dart';
import 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final SurahRepository repository;
  final AudioPlayer _player = AudioPlayer();
  List<SurahEntity> _surahs = [];
  int _currentIndex = 0;

  SurahCubit({required this.repository}) : super(SurahInitial());

  Future<void> init() async {
    try {
      emit(SurahLoading());
      _surahs = await repository.getAllSurahs();
      _listenToPlayer();
      emit(SurahPlayerState(
        surahs: _surahs,
        currentIndex: 0,
        isPlaying: false,
        currentPosition: Duration.zero,
        duration: Duration.zero,
      ));
    } catch (e) {
      emit(SurahError(e.toString()));
    }
  }
  void _listenToPlayer() {

    _player.positionStream.listen((position) {

      if (state is SurahPlayerState) {
        emit((state as SurahPlayerState)
            .copyWith(currentPosition: position));
      }
    });

    _player.durationStream.listen((duration) {
      if (state is SurahPlayerState && duration != null) {
        emit((state as SurahPlayerState)
            .copyWith(duration: duration));
      }
    });

    _player.playerStateStream.listen((playerState) {
      if (state is SurahPlayerState) {
        emit((state as SurahPlayerState).copyWith(
          isPlaying: playerState.playing,
        ));
      }
    });
  }
  Future<void> play() async {
    if (_surahs.isEmpty) return;

    final url = _surahs[_currentIndex].recitation;

    await _player.setUrl(url);
    await _player.play();
  }
  Future<void> pause() async {
    await _player.pause();
  }
  Future<void> stop() async {
    await _player.stop();

    if (state is SurahPlayerState) {
      emit((state as SurahPlayerState).copyWith(
        isPlaying: false,
        currentPosition: Duration.zero,
      ));
    }
  }
  Future<void> changeSurah(int index) async {
    _currentIndex = index;

    if (state is SurahPlayerState) {
      emit((state as SurahPlayerState).copyWith(
        currentIndex: index,
        currentPosition: Duration.zero,
      ));
    }

    await play();
  }
  void nextSurah() {
    if (_currentIndex < _surahs.length - 1) {
      changeSurah(_currentIndex + 1);
    }
  }
  void previousSurah() {
    if (_currentIndex > 0) {
      changeSurah(_currentIndex - 1);
    }
  }
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }
}