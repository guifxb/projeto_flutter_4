import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/favorite_cubit.dart';
import '../../data/model/movie_item.dart';
import '../home/movie_details_view.dart';

class MovieGridView extends StatelessWidget {
  final List<MovieItem> filteredMovies;

  const MovieGridView({super.key, required this.filteredMovies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        childAspectRatio: 2 / 3,
      ),
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        final heroTag = '$index-${movie.posterPath}';

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsView(
                  movie: movie,
                  heroTag: heroTag,
                ),
              ),
            ).then((_) {
              context.read<FavoriteCubit>().fetchFavorites();
            });
          },
          child: Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                movie.posterPath.isEmpty ? 'assets/images/placeholder.png' : 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.fill,
                height: 250,
              ),
            ),
          ),
        );
      },
    );
  }
}
