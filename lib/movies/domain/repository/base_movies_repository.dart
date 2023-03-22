import 'package:dartz/dartz.dart';

import '../../../app/errors/failure.dart';
import '../models/models.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> playingNowMovies();

  Future<Either<Failure, List<Movie>>> popularMovies();

  Future<Either<Failure, List<Movie>>> topRatedMovies();
}
