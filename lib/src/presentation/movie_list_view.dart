import 'package:flutter/material.dart';

import '../data/movie_repository.dart';
import 'categories_list_widget.dart';

class MovieListView extends StatelessWidget {
  final MovieRepository repository = MovieRepository();
  MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = repository.moviesList();
    final categoryNames = [
      "Ação",
      "Animação",
      "Drama",
      "Comédia",
      "Sci-Fi",
      "Crime"
    ];

    return Scaffold(
      body: CategoriesListWidget(
          categories: categories, categoryNames: categoryNames),
    );
  }
}
