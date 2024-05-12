import 'package:flutter/material.dart';
import '../../data/movie_item.dart';
import '../../mock/mock.dart';
import '../movie_details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieItem> _filteredMovies = [];

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
        _filteredMovies = uniqueMovies.values.toList();
      });
    } else {
      setState(() {
        _filteredMovies = [];
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        childAspectRatio: 2/3,
      ),
      itemCount: _filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = _filteredMovies[index];
        final heroTag = '$index-${movie.posterPath}';

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsView(
                  movie: movie,
                  heroTag: heroTag,
                ),
              ),
            );
          },
          child: Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                movie.posterPath,
                fit: BoxFit.cover, // Adjust fit as needed
                height: 400.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
