import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/settings/settings_controller.dart';
import 'package:flutter_filmes/src/settings/settings_view.dart';

import '../data/movie_repository.dart';
import 'bottom_app_bar.dart';
import 'categories_list_widget.dart';

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
      body: CategoriesListWidget(
          categories: categories, categoryNames: categoryNames),
      bottomNavigationBar: const BuildBottomAppBar(),
    );
  }
}
