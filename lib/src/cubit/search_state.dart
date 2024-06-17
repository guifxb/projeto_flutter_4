import 'package:equatable/equatable.dart';
import '../data/model/movie_item.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieItem> searchResult;

  const SearchLoaded(this.searchResult);

  @override
  List<Object> get props => [searchResult];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
