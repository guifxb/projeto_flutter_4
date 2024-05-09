import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/presentation/themes/theme.dart';
import 'package:flutter_filmes/src/presentation/themes/util.dart';

import 'presentation/movie_list_view.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          title: 'Samambaia Temp',
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: settingsController.themeMode,
          home: MovieListView(settingsController: settingsController),
        );
      },
    );
  }
}
