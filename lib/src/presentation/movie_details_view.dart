import 'package:flutter/material.dart';
import '../data/movie_item.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieItem movie;

  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: Column(children: [
          Image.asset(
            movie.posterPath,
            width: 200,
            height: 250,
          ),
          Text(movie.synopsis)
        ]),
      ),
    );
  }
}
