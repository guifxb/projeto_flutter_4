import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filmes/src/data/model/category_item.dart';
import '../data/category_repository.dart';
import '../data/model/category_list.dart';
import '../data/model/movie_item.dart';
import '../data/movie_repository.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  late final CategoryRepository categoryRepository;
  late final MovieRepository movieRepository;
  late final CategoryList categoryList;

  CategoryCubit(BuildContext context) : super(CategoryInitial()) {
    categoryRepository = context.read<CategoryRepository>();
    movieRepository = context.read<MovieRepository>();
    categoryList = context.read<CategoryList>();
    fetchCategories();
  }

  void fetchCategories() async {
    emit(CategoryInitial());
    try {
      await categoryList.initialize();
      List<CategoryItem> categories = await _fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError('Erro ao buscar categorias: $e'));
    }
  }

  Future<List<CategoryItem>> _fetchCategories() async {
    try {
      return await categoryRepository.getAllCategories();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar categorias: $e');
      } else {
        rethrow;
      }
      return [];
    }
  }

  Future<Map<String, List<MovieItem>>> getFavoriteCategoriesWithMovies() async {
    Map<String, List<MovieItem>> categoryMap = {};
    List<CategoryItem> allCategories = await _fetchCategories();

    List<MovieItem> nowPlayingMovies = await movieRepository.getNowPlayingMovies();
    categoryMap['Em Cartaz'] = nowPlayingMovies;

    if (categoryList.categoryIds.isEmpty) {
      for (var category in allCategories) {
        try {
          List<MovieItem> movies = await categoryRepository.getMoviesByCategory(category.id);
          if (movies.isNotEmpty) {
            categoryMap[category.name] = movies;
          }
        } catch (e) {
          if (kDebugMode) {
            print('Erro ao buscar filmes para a categoria ${category.name}: $e');
          }
        }
      }
    } else {
      for (var categoryId in categoryList.categoryIds) {
        try {
          CategoryItem category = allCategories.firstWhere((cat) => cat.id == categoryId);
          List<MovieItem> movies = await categoryRepository.getMoviesByCategory(categoryId);
          if (movies.isNotEmpty) {
            categoryMap[category.name] = movies;
          }
        } catch (e) {
          if (kDebugMode) {
            print('Erro ao buscar filmes para a categoria $categoryId: $e');
          }
        }
      }
    }
    return categoryMap;
  }

  void toggleFavorite(CategoryItem category) async {
    categoryList.toggleFavorite(category.id);
    fetchCategories();
  }
}
