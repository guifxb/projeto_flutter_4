class FavoritesList {
  final List<num> _movies = [];

  FavoritesList._privateConstructor();

  static final FavoritesList _instance = FavoritesList._privateConstructor();

  factory FavoritesList() {
    return _instance;
  }

  void toggle(num movieId) {
    if (_movies.contains(movieId)) {
      _movies.remove(movieId);
    } else {
      _movies.add(movieId);
    }
  }

  bool contains(num movieId) {
    return _movies.contains(movieId);
  }

  List<num> get movies => List.unmodifiable(_movies);
}
