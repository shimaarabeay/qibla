import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/ayah_entity.dart';

import '../../../domain/repositories/surah_repo.dart';
import 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final SurahRepository repository;

  SurahCubit({required this.repository}) : super(const SurahState()) {
    fetchSurah(1);
  }

  Future<void> fetchSurah(int surahNumber) async {
    emit(state.copyWith(status: SurahStatus.loading));

    try {
      final surah = await repository.getSurah(surahNumber);
      emit(state.copyWith(
        status: SurahStatus.loaded,
        surah: surah,
          playingAyahIndex: null
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SurahStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> togglePlayAyah(AyahEntity ayah, int index) async {
    final isPlaying = await repository.playAyah(ayah.audioPath);
    emit(state.copyWith(
      playingAyahIndex: isPlaying ? index : null,
    ));
  }
}