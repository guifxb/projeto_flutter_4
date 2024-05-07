// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_filmes/src/settings/settings_controller.dart';
import 'package:flutter_filmes/src/settings/settings_view.dart';

import '../data/movie_item.dart';
import '../data/movie_repository.dart';
import 'movie_details_view.dart';

class MovieListView extends StatelessWidget {
  final MovieRepository repository = MovieRepository();
  final SettingsController settingsController;

  MovieListView({super.key, required this.settingsController});

  AssetImage checkThemeMode(BuildContext context) {
    final Brightness currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? const AssetImage('assets/images/logo_white.png')
        : const AssetImage('assets/images/logo_black.png');
  }

  @override
  Widget build(BuildContext context) {
    final categories = repository.moviesList();
    final categoryNames = [
      "Ação",
      "Animação",
      "Drama",
      "Comédia",
      "Sci-Fi",
      "Crime"
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: AppBar().preferredSize.height * 0.7,
          child: Image(
            image: checkThemeMode(context),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsView(controller: settingsController),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(categories, categoryNames),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(
      List<List<MovieItem>> categories, List<String> categoryNames) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                categoryNames[index],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories[index].length,
                itemBuilder: (context, innerIndex) {
                  final item = categories[index][innerIndex];
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
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: 160,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset(
                              item.posterPath,
                              fit: BoxFit.fill,
                              height: 250,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Implemente a ação para a tela inicial
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implemente a ação para a tela de pesquisa
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Implemente a ação para a tela de perfil
            },
          ),
        ],
      ),
    );
  }
}
