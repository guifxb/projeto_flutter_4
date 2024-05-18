import 'package:flutter/material.dart';
import '../../data/model/movie_item.dart';
import 'movie_grid_view.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends State<FavoriteView> {
  List<MovieItem> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filterMovies();
  }

  void _filterMovies() {
    final allMovies = [

    ];
    final uniqueMovies = <int, MovieItem>{};

    for (var movie in allMovies) {
      if (movie.isFavorite) {
        uniqueMovies[movie.id] = movie;
      }
    }
    setState(() {
      filteredMovies = uniqueMovies.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieGridView(filteredMovies: filteredMovies),
    );
  }
}
