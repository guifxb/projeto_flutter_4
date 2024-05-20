import 'movie_item.dart';

class SeriesItem extends MovieItem {
  final List<String> originCountry;
  final String originalName;
  final String name;
  final String firstAirDate;

  SeriesItem(
    this.originCountry,
    this.originalName,
    this.name,
    this.firstAirDate, {
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.voteAverage,
    required super.video,
  }) : super(
          originalTitle: originalName,
          releaseDate: firstAirDate,
        );
}
