import 'package:dartz/dartz.dart';
import 'package:untitled1/app/base_use_cases/base_use_case.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';

import '../../../app/errors/failure.dart';
import '../entities/models.dart';

class PlayingNowMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter>{
  BaseMoviesRepository baseMoviesRepository;


  PlayingNowMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(parameter) async {
    return await baseMoviesRepository.playingNowMovies();
  }

}
