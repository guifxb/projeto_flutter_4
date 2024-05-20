import 'movie_item.dart';

class MovieDetail extends MovieItem {
  final int? budget;
  final List<Map<String, dynamic>> genres;
  final List<String> originCountry;
  final int? revenue;
  final int? runtime;

  MovieDetail({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    this.budget,
    required this.genres,
    required this.originCountry,
    this.revenue,
    this.runtime,
  });
}
