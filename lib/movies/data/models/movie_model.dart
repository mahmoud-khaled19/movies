import '../../domain/entities/models.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.image,
    required super.genderIds,
    required super.description,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      image: json['backdrop_path'],
      genderIds: List.from(json['genre_ids'].map((element) => element)),
      description: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date']);
}
