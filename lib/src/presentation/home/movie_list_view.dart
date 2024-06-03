import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';
import 'package:flutter_filmes/src/data/category_repository.dart';
import 'package:flutter_filmes/src/data/movie_repository.dart';
import 'package:flutter_filmes/src/data/model/category_list.dart';
import '../../data/model/category_item.dart';
import 'categories_list_widget.dart';
import 'category_filter.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  MovieListViewState createState() => MovieListViewState();
}

class MovieListViewState extends State<MovieListView> {
  final MovieRepository movieRepository = MovieRepository();
  final CategoryRepository categoryRepository = CategoryRepository();
  final CategoryList categoryList = CategoryList();
  Future<Map<String, List<MovieItem>>> _categoriesFuture = Future.value({});
  Future<List<CategoryItem>> _allCategoriesFuture = Future.value([]);
  List<num> _selectedCategories = [];


  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  Future<void> _initializeCategories() async {
    await categoryList.initialize();
    _allCategoriesFuture = categoryRepository.getAllCategories();
    setState(() {
      _selectedCategories = categoryList.categoryIds;
      _categoriesFuture = _fetchAllCategories(_selectedCategories);
    });
  }

  Future<Map<String, List<MovieItem>>> _fetchAllCategories(List<num> categoryIds) async {
    Map<String, List<MovieItem>> categoryMap = {};

    List<MovieItem> nowPlayingMovies = await movieRepository.getNowPlayingMovies();
    categoryMap['Em Cartaz'] = nowPlayingMovies;

    for (var categoryId in categoryIds) {
      CategoryItem category = (await _allCategoriesFuture).firstWhere((cat) => cat.id == categoryId);
      List<MovieItem> movies = await categoryRepository.getMoviesByCategory(category.id);
      categoryMap[category.name] = movies;
    }
    return categoryMap;
  }

  void _toggleCategory(num categoryId) async {
    await categoryList.toggleFavorite(categoryId);
    setState(() {
      _selectedCategories = categoryList.categoryIds;
      _categoriesFuture = _fetchAllCategories(_selectedCategories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gêneros de Filmes'),
        actions: [
          CategoryFilter(
            allCategoriesFuture: _allCategoriesFuture,
            selectedCategories: _selectedCategories,
            onCategoryToggle: _toggleCategory,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, List<MovieItem>>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final categoryMap = snapshot.data!;
            return CategoriesListWidget(categories: categoryMap);
          } else {
            return const Center(child: Text('Nenhum item encontrado'));
          }
        },
      ),
    );
  }
}
