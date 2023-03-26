import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.title,
    required super.image,
    required super.releaseDate,
    required super.movieTime,
    required super.voteAverage,
    required super.overView,
    required super.genres,
    required super.id,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        title: json['title'],
        image: json['backdrop_path'] ?? "gslT8t964rYXyqRcqrxFh77ikyb.jpg",
        releaseDate: json['release_date'],
        movieTime: json['runtime'],
        voteAverage: json['vote_average'],
        overView: json['overview'],
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        id: json['id'],
      );
}

class GenresModel extends Genres {
  GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
