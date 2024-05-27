import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/favorites_list.dart';
import '../data/model/movie_item.dart';
import '../data/movie_repository.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  late final MovieRepository movieRepository;
  late final FavoritesList favoritesList;

  FavoriteCubit(BuildContext context) : super(FavoriteInitial()) {
    movieRepository = context.read<MovieRepository>();
    favoritesList = context.read<FavoritesList>();
    fetchFavorites();
  }

  void fetchFavorites() async {
    emit(FavoriteInitial());
    try {
      var movies = await _fetchFavoriteMovies();
      emit(FavoriteLoaded(movies));
    } catch (e) {
      emit(FavoriteError('Erro ao buscar favoritos: $e'));
    }
  }

  Future<List<MovieItem>> _fetchFavoriteMovies() async {
    List<MovieItem> favorites = [];
    for (var movieId in favoritesList.favoriteMovieIds) {
      try {
        MovieItem movie = await movieRepository.getMovieById(movieId.toInt());
        if (favoritesList.isFavorite(movie.id)) {
          favorites.add(movie);
        }
      } catch (e) {
        if (kDebugMode) {
          print('Erro ao buscar favoritos: $e');
        }
      }
    }
    return favorites;
  }

  void toggleFavorite(MovieItem movie) async {
    favoritesList.toggleFavorite(movie.id);
    fetchFavorites();
  }
}
