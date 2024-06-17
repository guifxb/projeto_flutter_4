import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filmes/src/cubit/category_cubit.dart';
import 'package:flutter_filmes/src/cubit/favorite_cubit.dart';
import 'package:flutter_filmes/src/data/category_repository.dart';
import 'package:flutter_filmes/src/data/model/category_list.dart';
import 'package:flutter_filmes/src/data/model/favorites_list.dart';
import 'package:flutter_filmes/src/data/movie_repository.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(
    SettingsService(),
  );
  await settingsController.loadSettings();
  final movieRepository = MovieRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsController>.value(
          value: settingsController,
        ),
        Provider<MovieRepository>(create: (_) => movieRepository),
        Provider<FavoritesList>(create: (_) => FavoritesList()),
        Provider<CategoryRepository>(create: (_) => CategoryRepository()),
        Provider<CategoryList> (create: (_) => CategoryList()),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(context),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(context),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
