class MoviesEvent {
  const MoviesEvent();
}

class GetPlayingNowMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}
