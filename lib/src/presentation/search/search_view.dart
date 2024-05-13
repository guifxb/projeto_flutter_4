import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/presentation/search/movie_grid_view.dart';
import '../../data/movie_item.dart';
import '../../mock/mock.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieItem> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterMovies);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMovies);
    _searchController.dispose();
    super.dispose();
  }

  void _filterMovies() {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      final allMovies = [
        ...actionList,
        ...animsList,
        ...dramaList,
        ...crimeList,
        ...scifiList,
        ...comedyList,
      ];
      final uniqueMovies = <int, MovieItem>{};

      for (var movie in allMovies) {
        if (movie.title.toLowerCase().contains(query)) {
          uniqueMovies[movie.id] = movie;
        }
      }

      setState(() {
        filteredMovies = uniqueMovies.values.toList();
      });
    } else {
      setState(() {
        filteredMovies = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'O que você procura?',
          ),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
      body: MovieGridView(filteredMovies: filteredMovies),
    );
  }
}
