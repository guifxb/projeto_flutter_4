import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/data/model/favorites_list.dart';
import '../data/model/movie_item.dart';

class BigPoster extends StatefulWidget {
  BigPoster({
    super.key,
    required this.movie,
    required this.icon,
    required this.heroTag,
  });

  final MovieItem movie;
  final IconData icon;
  final String heroTag;
  FavoritesList favoriteList = FavoritesList();

  @override
  BigPosterState createState() => BigPosterState();
}

class BigPosterState extends State<BigPoster> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favoriteList.contains(widget.movie.id);
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.favoriteList.toggle(widget.movie.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color iconColor = theme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Material(
      child: Stack(
        children: [
          Hero(
            tag: widget.heroTag,
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
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
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
                widget.movie.title,
                style: theme.textTheme.headlineLarge,
              ),
              subtitle: Text(
                widget.movie.releaseDate,
                style: theme.textTheme.bodyLarge,
              ),
              trailing: Text(
                widget.movie.voteAverage.toString(),
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
                  onTap: toggleFavorite,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 50,
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
