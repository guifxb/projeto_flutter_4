import 'package:shared_preferences/shared_preferences.dart';

class FavoritesList {
  final List<num> _movies = [];
  static final FavoritesList _instance = FavoritesList._privateConstructor();

  FavoritesList._privateConstructor() {
    _loadFavorites();
  }

  factory FavoritesList() {
    return _instance;
  }

  void toggleFavorite(num movieId) async {
    if (_movies.contains(movieId)) {
      _movies.remove(movieId);
    } else {
      _movies.add(movieId);
    }
    await _saveToFavorites();
  }

  bool isFavorite(num movieId) => _movies.contains(movieId);

  List<num> get favoriteMovieIds => List.unmodifiable(_movies);

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> movieIds = prefs.getStringList('favorites') ?? [];
    _movies.addAll(movieIds.map(num.parse));
  }

  Future<void> _saveToFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _movies.map((id) => id.toString()).toList());
  }
}
