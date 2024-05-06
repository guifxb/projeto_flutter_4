// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  AssetImage checkThemeMode(BuildContext context) {
    final Brightness currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? const AssetImage('assets/images/logo_white.png')
        : const AssetImage('assets/images/logo_black.png');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: AppBar().preferredSize.height*0.7,
          child: Image(
            image: checkThemeMode(context),),
        ),

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
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: ListView(
        children: [
          _buildCategoryListView('Ação', items),
          _buildCategoryListView('Comédia', items),
          _buildCategoryListView('Drama', items),
          _buildCategoryListView('Animação', items),
          // Adicione mais categorias conforme necessário
        ],
      ),
    );
  }

  Widget _buildCategoryListView(String category, List<MovieItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(category, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 250,
          child: ListView.builder(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                item.posterPath,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              item.title,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
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