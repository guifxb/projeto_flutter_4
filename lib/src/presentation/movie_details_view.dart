import 'package:flutter/material.dart';
import '../data/model/favorites_list.dart';
import '../data/model/movie_item.dart';
import 'big_poster.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieItem movie;
  final String heroTag;
  FavoritesList favoriteList = FavoritesList();

  MovieDetailsView({super.key, required this.movie, required this.heroTag});

  IconData get icon =>
      favoriteList.contains(movie.id) ? Icons.favorite : Icons.favorite_border;

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
                movie.overview,
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
