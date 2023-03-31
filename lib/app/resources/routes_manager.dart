import 'package:flutter/material.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import '../../movies/presentation/screens/movie_screen/movie_screen.dart';
import '../../movies/presentation/screens/popular_movies_screen/popular_movies_screen.dart';
import '../../movies/presentation/screens/splash/splash_screen.dart';
import '../../movies/presentation/screens/top_rated_movies_screen/top_rated_movies_screen.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String mainMovieScreen = '/mainMovieScreen';
  static const String popularListMovies = '/ListMovies';
  static const String topRatedListMovies = '/top Rated Movies';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesManager.mainMovieScreen:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());
      case RoutesManager.popularListMovies:
        return MaterialPageRoute(builder: (_) => const PopularListMovies());
      case RoutesManager.topRatedListMovies:
        return MaterialPageRoute(builder: (_) => const TopRatedMoviesScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noDataFound),
              ),
              body: const Center(
                child: Text(AppStrings.noDataFound),
              ),
            ));
  }
}
