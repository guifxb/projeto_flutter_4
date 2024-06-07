import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/data/model/category_item.dart';

class CategoryFilter extends StatelessWidget {
  final Future<List<CategoryItem>> allCategoriesFuture;
  final List<num> selectedCategories;
  final Function(num) onCategoryToggle;

  const CategoryFilter({
    required this.allCategoriesFuture,
    required this.selectedCategories,
    required this.onCategoryToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryItem>>(
      future: allCategoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center();
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final categories = snapshot.data!;
          return PopupMenuButton<num>(
            icon: const Icon(Icons.filter_list),
            onSelected: onCategoryToggle,
            itemBuilder: (context) {
              return categories.map((category) {
                return CheckedPopupMenuItem<num>(
                  value: category.id,
                  checked: selectedCategories.contains(category.id),
                  child: Text(category.name),
                );
              }).toList();
            },
          );
        } else {
          return const Center(child: Text('Nenhum item encontrado'));
        }
      },
    );
  }
}
