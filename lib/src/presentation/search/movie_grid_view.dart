import 'package:flutter/material.dart';

import '../../data/movie_item.dart';
import '../movie_details_view.dart';

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
            );
          },
          child: Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                movie.posterPath,
                fit: BoxFit.cover, // Adjust fit as needed
                height: 400.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
