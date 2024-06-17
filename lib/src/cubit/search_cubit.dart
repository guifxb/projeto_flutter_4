import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/search_state.dart';
import '../data/model/movie_item.dart';
import '../data/movie_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  late final MovieRepository movieRepository;

  SearchCubit(BuildContext context) : super(SearchInitial()) {
    movieRepository = context.read<MovieRepository>();
  }

  void searchQuery(String searchInput) async {
    emit(SearchLoading());
    try {
      List<MovieItem> movieList =
          await movieRepository.searchMoviesByName(searchInput);
      emit(SearchLoaded(movieList));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
