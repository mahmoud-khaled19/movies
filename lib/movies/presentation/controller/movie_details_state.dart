part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<MovieRecommendations> movieRecommendations;
  final RequestState movieRecommendationsState;
  final String movieRecommendationsMessage;

  const MovieDetailsState({
      this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendations = const [],
    this.movieRecommendationsState = RequestState.loading,
    this.movieRecommendationsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<MovieRecommendations>? movieRecommendations,
    RequestState? movieRecommendationsState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsState:
          movieRecommendationsState ?? this.movieRecommendationsState,
      movieRecommendationsMessage:
          movieRecommendationsMessage ?? this.movieRecommendationsMessage,
    );
  }
}
