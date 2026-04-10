import '../entity/audio_entity.dart';

abstract class AudioRepository {
  Future<List<AudioEntity>> getAllSurahs({bool forceRefresh = false});
}