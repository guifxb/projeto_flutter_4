import 'package:flutter/material.dart';

import 'package:flutter_filmes/src/presentation/favorite/favorite_view.dart';
import 'package:flutter_filmes/src/presentation/search/search_view.dart';
import 'package:flutter_filmes/src/settings/settings_view.dart';

import 'movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  AssetImage checkThemeMode(BuildContext context) {
    final Brightness currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? const AssetImage('assets/images/logo_white.png')
        : const AssetImage('assets/images/logo_black.png');
  }

  final List<Widget> _pages = [
    MovieListView(),
    const SearchView(),
    const FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: AppBar().preferredSize.height * 0.7,
          child: Image(
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/logo_white.png'
                  : 'assets/images/logo_black.png',
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Pesquisar',
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
