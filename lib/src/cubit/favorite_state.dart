
import 'package:equatable/equatable.dart';

import '../data/model/movie_item.dart';

abstract class FavoriteState extends Equatable  {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<MovieItem> favoriteMovies;
  const FavoriteLoaded(this.favoriteMovies);

  @override
  List<Object> get props => [favoriteMovies];
}

class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
