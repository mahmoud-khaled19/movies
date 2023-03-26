import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/network_constance/enum.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendations.dart';
import '../../domain/use_cases/get_recommendation_movie_use_case.dart';
import '../../domain/use_cases/movie_details_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsUseCase movieDetailsUseCase;
  GetRecommendationUseCase  getRecommendationUseCase;

  MovieDetailsBloc(this.movieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<MovieSeeMoreDetails>(getMoviesDetails);
    on<MovieRecommendationEvent>(getMovieRecommendations);
  }

  FutureOr<void> getMoviesDetails(
      MovieSeeMoreDetails event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailsUseCase(MovieDetailsParameter(movieId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetailsState: RequestState.success,
        movieDetails: r,
      )),
    );
  }

  FutureOr<void> getMovieRecommendations(
      MovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameter(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieRecommendationsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieRecommendations: r,
            movieRecommendationsState: RequestState.success)));
  }
}
