import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/movies/presentation/controller/movie_states.dart';
import 'package:untitled1/movies/presentation/controller/movies_event.dart';

import '../../../app/network_constance/enum.dart';
import '../../domain/use_cases/playing_now_movies_use_case.dart';
import '../../domain/use_cases/popular_movies_use_case.dart';
import '../../domain/use_cases/top_rated_movies_use_case.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  PlayingNowMoviesUseCase playingNowMovies;
  PopularMoviesUseCase popularMoviesUseCase;
  TopRatedMoviesUseCase topRatedMoviesUseCase;

  MoviesBloc(
    this.playingNowMovies,
    this.topRatedMoviesUseCase,
    this.popularMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetPlayingNowMoviesEvent>(_getPlayingMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  FutureOr<void> _getPlayingMovies(
      GetPlayingNowMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await playingNowMovies.execute();
    result.fold(
        (left) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.error,
              nowPlayingMessage: left.message,
            )),
        (right) => emit(state.copyWith(
              nowPlayingMovies: right,
              nowPlayingMoviesState: RequestState.success,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await topRatedMoviesUseCase.execute();
    result.fold(
        (left) => emit(state.copyWith(
              topRatedMoviesState: RequestState.error,
              topRatedMessage: left.message,
            )),
        (right) => emit(state.copyWith(
              topRatedMovies: right,
              topRatedMoviesState: RequestState.success,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await popularMoviesUseCase.execute();

    result.fold(
        (left) => emit(state.copyWith(
              popularMoviesState: RequestState.error,
              popularMessage: left.message,
            )),
        (right) => emit(state.copyWith(
              popularMovies: right,
              popularMoviesState: RequestState.success,
            )));
  }
}
