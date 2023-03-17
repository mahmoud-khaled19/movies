import 'package:dartz/dartz.dart';
import 'package:untitled1/movies/domain/models/models.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';

import '../../../app/errors/failure.dart';

class PlayingNowMovies {
  BaseMoviesRepository baseMoviesRepository;


  PlayingNowMovies(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>>execute() async {
   return await baseMoviesRepository.playingNowMovies();
  }
}
