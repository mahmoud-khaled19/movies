import 'package:dartz/dartz.dart';
import 'package:untitled1/app/base_use_cases/base_use_case.dart';
import 'package:untitled1/app/errors/failure.dart';
import 'package:untitled1/movies/domain/entities/movie_details.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';

class MovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameter> {
  BaseMoviesRepository baseMoviesRepository;

  MovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameter parameter) async {
    return await baseMoviesRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameter {
  final int movieId;

  MovieDetailsParameter({
    required this.movieId,
  });
}
