import 'package:dartz/dartz.dart';

import '../../../app/errors/failure.dart';
import '../entities/models.dart';
import '../entities/movie_details.dart';
import '../entities/recommendations.dart';
import '../use_cases/get_recommendation_movie_use_case.dart';
import '../use_cases/movie_details_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> playingNowMovies();

  Future<Either<Failure, List<Movie>>> popularMovies();

  Future<Either<Failure, List<Movie>>> topRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter);

  Future<Either<Failure, List<MovieRecommendations>>> getMovieRecommendation(
      RecommendationParameter parameter);
}
