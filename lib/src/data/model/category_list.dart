import 'package:shared_preferences/shared_preferences.dart';

class CategoryList {
  final List<num> _categories = [];
  static final CategoryList _instance = CategoryList._privateConstructor();

  CategoryList._privateConstructor();

  factory CategoryList() {
    return _instance;
  }

  Future<void> initialize() async {
    await _loadCategories();
  }

  Future<void> toggleFavorite(num categoryId) async {
    if (_categories.contains(categoryId)) {
      _categories.remove(categoryId);
    } else {
      _categories.add(categoryId);
    }
    await _saveToFavorites();
  }

  bool isFavorite(num movieId) => _categories.contains(movieId);

  List<num> get categoryIds => List.unmodifiable(_categories);

  Future<void> _loadCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> categoryId = prefs.getStringList('categories') ?? [];
    _categories.clear();
    _categories.addAll(categoryId.map(num.parse));
  }

  Future<void> _saveToFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('categories', _categories.map((id) => id.toString()).toList());
  }
}
