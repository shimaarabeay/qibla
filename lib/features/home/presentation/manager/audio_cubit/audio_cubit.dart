import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/entity/audio_entity.dart';
import '../../../domain/repositories/audio_repository.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepository repository;
  final AudioPlayer _player = AudioPlayer();

  List<AudioEntity> _surahs = [];
  int _currentIndex = 0;

  AudioCubit({required this.repository}) : super(SurahInitial());

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
        emit((state as SurahPlayerState).copyWith(currentPosition: position));
      }
    });

    _player.durationStream.listen((duration) {
      if (state is SurahPlayerState && duration != null) {
        emit((state as SurahPlayerState).copyWith(duration: duration));
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

  Future<void> resume() async {
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

    final url = _surahs[_currentIndex].recitation;

    await _player.setUrl(url); // 👈 هنا بس

    if (state is SurahPlayerState) {
      emit((state as SurahPlayerState).copyWith(
        currentIndex: index,
        currentPosition: Duration.zero,
      ));
    }
  }

  void nextSurah() {
    if (_surahs.isEmpty) return;

    if (_currentIndex == _surahs.length - 1) {
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }

    changeSurah(_currentIndex);
    resume();
  }

  void previousSurah() {
    if (_surahs.isEmpty) return;

    if (_currentIndex == 0) {
      _currentIndex = _surahs.length - 1;
    } else {
      _currentIndex--;
    }

    changeSurah(_currentIndex);
    resume();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }
}
