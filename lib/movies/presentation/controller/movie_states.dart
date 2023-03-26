import 'package:untitled1/app/network_constance/enum.dart';

import '../../domain/entities/models.dart';
class MoviesState {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String nowPlayingMessage;
  final String topRatedMessage;
  final String popularMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = '',
    this.topRatedMessage = '',
    this.popularMessage = '',
    this.nowPlayingMoviesState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? popularMovies,
    RequestState? nowPlayingMoviesState,
    RequestState? topRatedMoviesState,
    RequestState? popularMoviesState,
    String? nowPlayingMessage,
    String? topRatedMessage,
    String? popularMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState: nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}
