import 'package:dartz/dartz.dart';
import 'package:untitled1/app/errors/exceptions.dart';
import 'package:untitled1/app/errors/failure.dart';
import 'package:untitled1/movies/data/data_source/movie_remote_data_source.dart';
import 'package:untitled1/movies/domain/entities/movie_details.dart';
import 'package:untitled1/movies/domain/entities/recommendations.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';
import 'package:untitled1/movies/domain/use_cases/get_recommendation_movie_use_case.dart';

import '../../domain/entities/models.dart';
import '../../domain/use_cases/movie_details_use_case.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> playingNowMovies() async {
    final result = await baseMovieRemoteDataSource.getPlayingNowMovies();
    try {
      return right(result);
    } on ServerExceptions catch (f) {
      return left(ServerFailure(f.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> popularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return right(result);
    } on ServerExceptions catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> topRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return right(result);
    } on ServerExceptions catch (f) {
      return left(ServerFailure(f.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
    print(result.toString());
    try {
      return right(result);
    } on ServerExceptions catch (f) {
      return left(ServerFailure(f.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>> getMovieRecommendation(
      RecommendationParameter parameter) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendationsMovies(parameter);
    try {
      return right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
