import 'package:flutter/material.dart';
import 'package:untitled1/app/services/services_locator.dart';

import 'app/resources/colors_manager.dart';
import 'app/resources/routes_manager.dart';
import 'app/resources/theme_manager.dart';

void main() {
  ServicesLocator().init();
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
      
      theme: getLightApplicationTheme().copyWith(
        scaffoldBackgroundColor: ColorManager.darkGrey
      ),
    );
  }
}
