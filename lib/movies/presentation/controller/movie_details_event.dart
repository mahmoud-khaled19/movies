part of 'movie_details_bloc.dart';

class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class MovieSeeMoreDetails extends MovieDetailsEvent {
  final int id;

  const MovieSeeMoreDetails({required this.id});
}

  class MovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  const MovieRecommendationEvent({required this.id});
}
