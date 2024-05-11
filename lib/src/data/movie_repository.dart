import 'movie_item.dart';
import '../mock/mock.dart';

class MovieRepository {
  final List<MovieItem> _action = actionList;
  final List<MovieItem> _anims = animsList;
  final List<MovieItem> _drama = dramaList;
  final List<MovieItem> _crime = crimeList;
  final List<MovieItem> _comedy = comedyList;
  final List<MovieItem> _scifi = scifiList;

  List<List<MovieItem>> moviesList() {
    return List.unmodifiable(
        [_action, _anims, _drama, _comedy, _scifi, _crime]);
  }

// void toggleFavorite(int id) {
//   _movies.firstWhere((movie) => movie.id == id).isFavorite = !_movies.firstWhere((movie) => movie.id == id).isFavorite;
// }
}
