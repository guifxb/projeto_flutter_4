import 'package:flutter/material.dart';
import 'package:flutter_filmes/src/presentation/home/home_screen.dart';
import 'package:flutter_filmes/src/presentation/themes/theme.dart';
import 'package:flutter_filmes/src/presentation/themes/util.dart';
import 'package:provider/provider.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    TextTheme textTheme = createTextTheme(
      context,
      "Roboto",
      "Poppins",
    );
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
          home: const HomeScreen(),
        );
      },
    );
  }
}
