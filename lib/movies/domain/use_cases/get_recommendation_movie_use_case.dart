import 'package:dartz/dartz.dart';
import 'package:untitled1/app/base_use_cases/base_use_case.dart';
import 'package:untitled1/app/errors/failure.dart';
import 'package:untitled1/movies/domain/repository/base_movies_repository.dart';

import '../entities/recommendations.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<MovieRecommendations>, RecommendationParameter> {
  BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(RecommendationParameter parameter) async {
    return await baseMoviesRepository.getMovieRecommendation(parameter);
  }
}
class RecommendationParameter{
  final int id;

  RecommendationParameter({
    required this.id
});
}