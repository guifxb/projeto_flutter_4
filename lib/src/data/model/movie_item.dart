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

  MovieItem( {
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

  MovieItem.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        genreIds = (json['genre_ids'] as List).cast<int>(),
        id = json['id'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'];
}
