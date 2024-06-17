import 'package:flutter_filmes/src/data/model/favorites_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  group('validação da manipulação de dados nos favoritos', () {
  test('lista inicial de favoritos está vazia', () async {
    final FavoritesList favoritesList = FavoritesList();
    expect(favoritesList.favoriteMovieIds, isEmpty);
  });

  test('adiciona e remove favoritos', () async {
  final favoritesList = FavoritesList();

  // Adiciona um filme
  favoritesList.toggleFavorite(1);
  expect(favoritesList.isFavorite(1), isTrue);
  expect(favoritesList.favoriteMovieIds, contains(1));

  // Remove o filme
  favoritesList.toggleFavorite(1);
  expect(favoritesList.isFavorite(1), isFalse);
  expect(favoritesList.favoriteMovieIds, isNot(contains(1)));
  });
  });
}