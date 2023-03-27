import 'package:flutter/material.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import 'package:untitled1/app/services/services_locator.dart';

import 'app/resources/routes_manager.dart';
import 'app/resources/theme_manager.dart';
import 'movies/data/data_source/local_data_source.dart';

void main() async {
  await CacheHelper.init();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      theme: getLightApplicationTheme(),
    );
  }
}
