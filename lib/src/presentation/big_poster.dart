import 'package:flutter/material.dart';
import '../data/movie_item.dart';
import '../mock/mock.dart';

class BigPoster extends StatefulWidget {
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
  BigPosterState createState() => BigPosterState();
}

class BigPosterState extends State<BigPoster> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.movie.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.movie.isFavorite = isFavorite;
    });
    _updateFavoriteStatus(widget.movie.id, isFavorite);
  }

  void _updateFavoriteStatus(int movieId, bool isFavorite) {
    void updateList(List<MovieItem> list) {
      for (var movie in list) {
        if (movie.id == movieId) {
          movie.isFavorite = isFavorite;
        }
      }
    }
    updateList(actionList);
    updateList(animsList);
    updateList(dramaList);
    updateList(crimeList);
    updateList(scifiList);
    updateList(comedyList);
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
              child: Image.asset(
                widget.movie.posterPath,
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
                widget.movie.year.toString(),
                style: theme.textTheme.bodyLarge,
              ),
              trailing: Text(
                "${(widget.movie.duration ~/ 60)}h ${(widget.movie.duration % 60)}m",
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
