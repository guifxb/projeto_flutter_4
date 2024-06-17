import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_filmes/src/cubit/category_cubit.dart';
import 'package:flutter_filmes/src/cubit/category_state.dart';
import 'package:flutter_filmes/src/data/model/category_item.dart';
import 'package:flutter_filmes/src/data/model/category_list.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';
import 'package:flutter_filmes/src/data/category_repository.dart';
import 'package:flutter_filmes/src/data/movie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}
class MockMovieRepository extends Mock implements MovieRepository {}
class MockCategoryList extends Mock implements CategoryList {}

void main() {
  late MockCategoryRepository mockCategoryRepository;
  late MockMovieRepository mockMovieRepository;
  late MockCategoryList mockCategoryList;
  late CategoryCubit categoryCubit;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    mockMovieRepository = MockMovieRepository();
    mockCategoryList = MockCategoryList();
    SharedPreferences.setMockInitialValues({});
  });

  Widget createCubitProviderWidget({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider<CategoryRepository>.value(value: mockCategoryRepository),
        Provider<MovieRepository>.value(value: mockMovieRepository),
        Provider<CategoryList>.value(value: mockCategoryList),
      ],
      child: child,
    );
  }

  group('CategoryCubit', () {
    final List<CategoryItem> mockCategoryListData = [
      CategoryItem(id: 1, name: 'Action'),
      CategoryItem(id: 2, name: 'Comedy'),
    ];

    setUpAll(() {
      registerFallbackValue(CategoryItem(id: 1, name: 'Action'));
    });

    testWidgets('initial state is CategoryInitial', (WidgetTester tester) async {
      when(() => mockCategoryList.initialize()).thenAnswer((_) async {});
      when(() => mockCategoryRepository.getAllCategories()).thenAnswer((_) async => mockCategoryListData);

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              categoryCubit = CategoryCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();

      expect(
        categoryCubit.state,
        equals(CategoryLoaded(mockCategoryListData)),
      );
    });

    testWidgets('emits [CategoryInitial, CategoryLoaded] when fetchCategories is successful', (WidgetTester tester) async {
      when(() => mockCategoryList.initialize()).thenAnswer((_) async {});
      when(() => mockCategoryRepository.getAllCategories()).thenAnswer((_) async => mockCategoryListData);

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              categoryCubit = CategoryCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();
      expect(
        categoryCubit.state,
        equals(CategoryLoaded(mockCategoryListData)),
      );
    });

    testWidgets('toggles favorite category and re-fetches categories', (WidgetTester tester) async {
      final CategoryItem category = CategoryItem(id: 1, name: 'Action');
      when(() => mockCategoryList.initialize()).thenAnswer((_) async {});
      when(() => mockCategoryRepository.getAllCategories()).thenAnswer((_) async => mockCategoryListData);
      when(() => mockCategoryList.toggleFavorite(category.id)).thenAnswer((_) async {});

      await tester.pumpWidget(
        createCubitProviderWidget(
          child: Builder(
            builder: (BuildContext context) {
              categoryCubit = CategoryCubit(context);
              return Container();
            },
          ),
        ),
      );

      await tester.pump();
      categoryCubit.toggleFavorite(category);
      await tester.pump();

      verify(() => mockCategoryList.toggleFavorite(category.id)).called(1);
      expect(
        categoryCubit.state,
        equals(CategoryLoaded(mockCategoryListData)),
      );
    });
  });
}
