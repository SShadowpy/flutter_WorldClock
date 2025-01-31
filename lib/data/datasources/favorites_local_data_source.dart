import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritesLocalDataSource {
  Future<void> addFavorite(String city);
  Future<void> removeFavorite(String city);
  Future<List<String>> getFavorites();
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String favoritesKey = 'favoriteCities';

  @override
  Future<void> addFavorite(String city) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(favoritesKey) ?? [];
    if (!favorites.contains(city)) {
      favorites.add(city);
      await prefs.setStringList(favoritesKey, favorites);
    }
  }

  @override
  Future<void> removeFavorite(String city) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(favoritesKey) ?? [];
    favorites.remove(city);
    await prefs.setStringList(favoritesKey, favorites);
  }

  @override
  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritesKey) ?? [];
  }
}
