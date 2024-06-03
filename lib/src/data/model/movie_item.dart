class MovieItem {
  final String backdropPath;
  final List<int> genreIds;
  final num id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;

  MovieItem({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    List<int> parseGenres(List<dynamic> genres) {
      return genres.map((genre) => genre['id'] as int).toList();
    }
    return MovieItem(
      backdropPath: json['backdrop_path'] as String? ?? '',
      genreIds: parseGenres(json['genres'] as List<dynamic>? ?? []),
      id: json['id'] as num,
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: json['vote_average'] as num? ?? 0,
    );
  }
}
