import '../data/model/movie_item.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieItem> searchResult;
  const SearchLoaded(this.searchResult);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
