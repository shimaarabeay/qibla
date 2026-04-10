import '../../domain/entity/audio_entity.dart';

import '../../domain/repositories/audio_repository.dart';
import '../data_source/remote_data_source.dart';
import '../data_source/local_data_source.dart';







class AudioRepositoryImpl implements AudioRepository {
  final AudioLocalDataSource localDataSource;
  final AudioRemoteDataSource remoteDataSource;

  AudioRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<AudioEntity>> getAllSurahs({bool forceRefresh = false}) async {
    try {

      if (!forceRefresh) {
        final cached = localDataSource.getCachedSurahs();
        if (cached.isNotEmpty) {
          return cached.map((model) => model.toEntity()).toList();
        }
      }

      final remoteSurahs = await remoteDataSource.fetchSurahs();
      await localDataSource.cacheSurahs(remoteSurahs);
      return remoteSurahs.map((model) => model.toEntity()).toList();
    } catch (e) {

      final cached = localDataSource.getCachedSurahs();
      if (cached.isNotEmpty) {
        return cached.map((model) => model.toEntity()).toList();
      }

      throw Exception('Failed to load Surahs: $e');
    }
  }
}