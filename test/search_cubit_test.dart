import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/cubit/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_filmes/src/cubit/search_cubit.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';
import 'package:flutter_filmes/src/data/movie_repository.dart';


class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository mockMovieRepository;
  late SearchCubit searchCubit;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
  });

  Widget createCubitProviderWidget({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider<MovieRepository>.value(value: mockMovieRepository),
      ],
      child: child,
    );
  }

  group('SearchCubit', () {
    const String searchQuery = 'Avengers';
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

    testWidgets('initial state is SearchInitial', (WidgetTester tester) async {
      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              final searchCubit = SearchCubit(context);
              expect(searchCubit.state, equals(SearchInitial()));
              searchCubit.close();
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('emits [SearchLoading, SearchLoaded] when searchQuery is successful', (WidgetTester tester) async {
      when(() => mockMovieRepository.searchMoviesByName(searchQuery))
          .thenAnswer((_) async => mockMovieList);

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              searchCubit = SearchCubit(context);
              searchCubit.searchQuery(searchQuery);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();
      expect(
        searchCubit.state,
        equals(SearchLoaded(mockMovieList)),
      );
    });

    testWidgets('emits [SearchLoading, SearchError] when searchQuery fails', (WidgetTester tester) async {
      const String searchQueryWithError = 'ErrorQuery';

      when(() => mockMovieRepository.searchMoviesByName(searchQueryWithError))
          .thenThrow(Exception('Connection failed'));

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              searchCubit = SearchCubit(context);
              searchCubit.searchQuery(searchQueryWithError);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();

      expect(
        searchCubit.state,
        equals(const SearchError('Exception: Connection failed')),
      );
    });
  });
}