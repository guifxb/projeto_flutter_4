import 'package:flutter/material.dart';

import '../../data/model/movie_item.dart';
import '../../data/movie_repository.dart';
import 'categories_list_widget.dart';

class MovieListView extends StatelessWidget {
  final MovieRepository repository = MovieRepository();
  MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = repository.getNowPlayingMovies();
    final categoryNames = [
      "Em Cartaz",
      "Animação",
      "Drama",
      "Comédia",
      "Sci-Fi",
      "Crime"
    ];

    return Scaffold(
      body: FutureBuilder<List<MovieItem>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return CategoriesListWidget(
              categories: [movies],
              categoryNames: categoryNames,
            );
          } else {
            return const Center(child: Text('Nenhum item encontrado'));
          }
        },
      ),
    );
  }
}
