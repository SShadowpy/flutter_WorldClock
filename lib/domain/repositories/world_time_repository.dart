import 'package:pj1/domain/entities/world_time.dart';

abstract class WorldTimeRepository {
  /// Fetch the current time for a given city (e.g., 'Europe/London').
  Future<WorldTime> getWorldTime(String city);

  /// Add city to favorites
  Future<void> addFavorite(String city);

  /// Remove city from favorites
  Future<void> removeFavorite(String city);

  /// Get all favorite cities
  Future<List<String>> getFavoriteCities();
}
