import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filmes/src/data/model/category_item.dart';

import '../data/category_repository.dart';
import '../data/model/category_list.dart';
import '../data/model/movie_item.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  late final CategoryRepository categoryRepository;
  late final CategoryList categoryList;

  CategoryCubit(BuildContext context) : super(CategoryInitial()) {
    categoryRepository = context.read<CategoryRepository>();
    categoryList = context.read<CategoryList>();
    fetchCategories();
  }

  void fetchCategories() async {
    emit(CategoryInitial());
    try {
      var categories = await _fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError('Erro ao buscar categorias: $e'));
    }
  }

  Future<List<CategoryItem>> _fetchCategories() async {
    List<CategoryItem> categories = [];
    try {
      categories = await categoryRepository.getAllCategories();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar categorias: $e');
      }
    }
    return categories;
  }

  Future<Map<num, List<MovieItem>>> getFavoriteCategoriesWithMovies() async {
    Map<num, List<MovieItem>> favoriteCategories = {};
    for (var categoryId in categoryList.categoryIds) {
      try {
        List<MovieItem> movies = await categoryRepository.getMoviesByCategory(categoryId);
        if (movies.isNotEmpty) {
          favoriteCategories[categoryId] = movies;
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return favoriteCategories;
  }

  void toggleFavorite(CategoryItem category) async {
    categoryList.toggleFavorite(category.id);
    fetchCategories();
  }
}
