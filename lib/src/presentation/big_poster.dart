import 'package:flutter/material.dart';
import '../data/movie_item.dart';

class BigPoster extends StatelessWidget {
  const BigPoster({
    super.key,
    required this.movie,
    required this.icon,
    required this.heroTag,
  });

  final MovieItem movie;
  final IconData icon;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color iconColor = theme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Material(
      child: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.primaryColor.withOpacity(0.35),
                    theme.cardColor,
                  ],
                ),
              ),
              child: Image.asset(
                movie.posterPath,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: ListTile(
              title: Text(
                movie.title,
                style: theme.textTheme.headlineLarge,
              ),
              subtitle: Text(
                movie.year.toString(),
                style: theme.textTheme.bodyLarge,
              ),
              trailing: Text(
                "${(movie.duration ~/ 60)}h ${(movie.duration % 60)}m",
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            top: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: iconColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    movie.isFavorite = !movie.isFavorite;
                  },
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
