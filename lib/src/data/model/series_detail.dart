import 'movie_item.dart';

class SeriesDetail extends MovieItem {
  final List<int> episodeRunTime;
  final String originalName;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String firstAirDate;

  SeriesDetail(
    this.episodeRunTime,
    this.firstAirDate,
    this.name,
    this.originalName,
    this.numberOfEpisodes,
    this.numberOfSeasons, {
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.title,
    required super.video,
    required super.voteAverage,
  }) : super(
          originalTitle: originalName,
          releaseDate: firstAirDate,
        );
}
