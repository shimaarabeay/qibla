import '../../domain/entity/surah_entity.dart';

import '../../domain/repositories/surah_repository.dart';
import '../data_source/remote_data_source.dart';
import '../data_source/surah_local_data_source.dart';







class SurahRepositoryImpl implements SurahRepository {
  final SurahLocalDataSource localDataSource;
  final SurahRemoteDataSource remoteDataSource;

  SurahRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<SurahEntity>> getAllSurahs({bool forceRefresh = false}) async {
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