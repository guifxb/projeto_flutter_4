import 'package:flutter/material.dart';
import '../data/movie_item.dart';
import 'big_poster.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieItem movie;
  final String heroTag;

  const MovieDetailsView({super.key, required this.movie, required this.heroTag});

  IconData get icon =>
      movie.isFavorite ? Icons.favorite : Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            BigPoster(movie: movie, icon: icon, heroTag: heroTag),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movie.synopsis,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
