import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/data/model/favorites_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_filmes/src/cubit/favorite_state.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';
import 'package:flutter_filmes/src/data/movie_repository.dart';
import 'package:flutter_filmes/src/cubit/favorite_cubit.dart';


class MockMovieRepository extends Mock implements MovieRepository {}

class MockFavoritesList extends Mock implements FavoritesList {}

void main() {
  late MockMovieRepository mockMovieRepository;
  late MockFavoritesList mockFavoritesList;
  late FavoriteCubit favoriteCubit;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    mockFavoritesList = MockFavoritesList();
  });

  Widget createCubitProviderWidget({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider<MovieRepository>.value(value: mockMovieRepository),
        Provider<FavoritesList>.value(value: mockFavoritesList),
      ],
      child: child,
    );
  }

  group('FavoriteCubit', () {
    final List<MovieItem> mockMovieList = [
      MovieItem(
        backdropPath: '/path_to_backdrop.jpg',
        genreIds: [28, 12, 878],
        id: 1,
        originalTitle: 'The Avengers',
        overview: 'Earth\'s mightiest heroes must come together...',
        posterPath: '/path_to_poster.jpg',
        releaseDate: '2012-04-25',
        title: 'The Avengers',
        video: false,
        voteAverage: 8.0,
      ),
    ];

    setUp(() {
      when(() => mockFavoritesList.favoriteMovieIds).thenReturn([1]);
      when(() => mockFavoritesList.isFavorite(any())).thenReturn(true);
      when(() => mockMovieRepository.getMovieById(1)).thenAnswer((_) async => mockMovieList[0]);
    });

    testWidgets('initial state is FavoriteInitial', (WidgetTester tester) async {
      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              favoriteCubit = FavoriteCubit(context);
              expect(favoriteCubit.state, equals(FavoriteInitial()));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('emits [FavoriteInitial, FavoriteLoaded] when fetchFavorites is successful', (WidgetTester tester) async {
      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              favoriteCubit = FavoriteCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();

      expect(
        favoriteCubit.state,
        equals(FavoriteLoaded(mockMovieList)),
      );
    });

    testWidgets('emits [FavoriteInitial, FavoriteError] when fetchFavorites fails', (WidgetTester tester) async {
      when(() => mockFavoritesList.favoriteMovieIds).thenReturn([1]);
      when(() => mockMovieRepository.getMovieById(1)).thenThrow(Exception('Connection failed'));

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              favoriteCubit = FavoriteCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();

      expect(
        favoriteCubit.state,
        equals(const FavoriteError('Erro ao buscar favoritos: Exception: Connection failed')),
      );
    });

    testWidgets('toggles favorite status and updates state', (WidgetTester tester) async {
      when(() => mockFavoritesList.toggleFavorite(1)).thenReturn(null);

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              favoriteCubit = FavoriteCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();

      favoriteCubit.toggleFavorite(mockMovieList[0]);

      await tester.pump();

      verify(() => mockFavoritesList.toggleFavorite(1)).called(1);
      expect(
        favoriteCubit.state,
        equals(FavoriteLoaded(mockMovieList)),
      );
    });
  });
}
