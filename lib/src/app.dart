import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/presentation/home_screen.dart';
import 'package:flutter_filmes/src/presentation/themes/theme.dart';
import 'package:flutter_filmes/src/presentation/themes/util.dart';

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

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          title: 'Samambaia Temp',
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: settingsController.themeMode,
          home: HomeScreen(settingsController: settingsController),
        );
      },
    );
  }
}

