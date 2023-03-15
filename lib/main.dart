import 'package:flutter/material.dart';

import 'movies/presentation/resources/routes_manager.dart';
import 'movies/presentation/resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
// test repooo