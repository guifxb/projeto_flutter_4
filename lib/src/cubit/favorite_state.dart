
import '../data/model/movie_item.dart';

abstract class FavoriteState {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<MovieItem> favoriteMovies;
  const FavoriteLoaded(this.favoriteMovies);
}

class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);
}
