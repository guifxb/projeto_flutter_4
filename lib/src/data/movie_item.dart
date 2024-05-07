class MovieItem {
  final int id;
  final String title;
  final String posterPath;
  final String synopsis;
  bool isFavorite;
  final int duration;
  final int year;
  final String category;

  MovieItem({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.synopsis,
    this.isFavorite = false,
    required this.duration,
    required this.year,
    required this.category,
  });
}
