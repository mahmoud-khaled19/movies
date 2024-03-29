import 'package:get_it/get_it.dart';
import 'package:untitled1/movies/data/data_source/movie_remote_data_source.dart';
import 'package:untitled1/movies/data/repository/movies_repository.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';
import 'package:untitled1/movies/domain/use_cases/get_recommendation_movie_use_case.dart';
import 'package:untitled1/movies/domain/use_cases/movie_details_use_case.dart';
import 'package:untitled1/movies/domain/use_cases/playing_now_movies_use_case.dart';
import 'package:untitled1/movies/domain/use_cases/popular_movies_use_case.dart';
import 'package:untitled1/movies/domain/use_cases/top_rated_movies_use_case.dart';
import 'package:untitled1/movies/presentation/controller/movie_bloc.dart';
import 'package:untitled1/movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    // useCases
    sl.registerLazySingleton(() => PlayingNowMoviesUseCase(sl()));
    sl.registerLazySingleton(() => PopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => TopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => MovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    // repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
  }
}
