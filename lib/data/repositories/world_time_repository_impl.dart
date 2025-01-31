import 'package:pj1/domain/entities/world_time.dart';
import 'package:pj1/domain/repositories/world_time_repository.dart';

import '../datasources/favorites_local_data_source.dart';
import '../datasources/world_time_remote_data_source.dart';

class WorldTimeRepositoryImpl implements WorldTimeRepository {
  final WorldTimeRemoteDataSource remoteDataSource;
  final FavoritesLocalDataSource localDataSource;

  WorldTimeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<WorldTime> getWorldTime(String city) async {
    return await remoteDataSource.getWorldTime(city);
  }

  @override
  Future<void> addFavorite(String city) async {
    await localDataSource.addFavorite(city);
  }

  @override
  Future<void> removeFavorite(String city) async {
    await localDataSource.removeFavorite(city);
  }

  @override
  Future<List<String>> getFavoriteCities() async {
    return await localDataSource.getFavorites();
  }
}
