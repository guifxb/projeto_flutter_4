import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';
import '../../data/model/category_item.dart';
import '../../data/model/category_list.dart';
import 'categories_list_widget.dart';
import 'category_filter.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  MovieListViewState createState() => MovieListViewState();
}

class MovieListViewState extends State<MovieListView> {
  List<num> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    final categoryCubit = context.read<CategoryCubit>();
    categoryCubit.fetchCategories();
  }

  void _toggleCategory(num categoryId) async {
    final categoryCubit = context.read<CategoryCubit>();
    categoryCubit.toggleFavorite(CategoryItem(id: categoryId, name: ''));
    setState(() {
      _selectedCategories = context.read<CategoryList>().categoryIds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gêneros de Filmes'),
        actions: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoaded) {
                return CategoryFilter(
                  allCategoriesFuture: Future.value(state.categories),
                  selectedCategories: _selectedCategories,
                  onCategoryToggle: _toggleCategory,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoaded) {
            return FutureBuilder<Map<String, List<MovieItem>>>(
              future: context.read<CategoryCubit>().getFavoriteCategoriesWithMovies(),
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
            );
          } else if (state is CategoryError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Estado desconhecido'));
          }
        },
      ),
    );
  }
}
