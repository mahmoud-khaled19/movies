import 'package:flutter/material.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import '../../movies/presentation/screens/movie_screen/movie_screen.dart';
import '../../movies/presentation/screens/on_boarding_screen/on_boarding_screen.dart';
import '../../movies/presentation/screens/splash/splash_screen.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String mainMovieScreen = '/mainMovieScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesManager.mainMovieScreen:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());

      // case RoutesManager.onBoardingScreen:
      //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noPageFound),
              ),
              body: const Center(
                child: Text(AppStrings.noPageFound),
              ),
            ));
  }
}
