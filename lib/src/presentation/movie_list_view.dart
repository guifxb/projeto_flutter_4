import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/settings/settings_controller.dart';
import 'package:flutter_filmes/src/settings/settings_view.dart';

import '../data/movie_item.dart';
import '../data/movie_repository.dart';
import 'movie_details_view.dart';

class MovieListView extends StatelessWidget {
  static final MovieRepository repository = MovieRepository();
  final SettingsController settingsController;
  final List<MovieItem> items = repository.moviesList();

  MovieListView({
    super.key,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FILMES'),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsView(controller: settingsController),
                  ),
                );
              }
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsView(movie: item),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Image.asset(
                      item.posterPath,
                      width: 200,
                      height: 250,),
                  Text(item.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

