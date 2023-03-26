
import '../../domain/entities/recommendations.dart';

class MovieRecommendationModel extends MovieRecommendations {
  MovieRecommendationModel({
    required super.id,
    required super.image,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        id: json['id'],
        image: json['backdrop_path'] ?? "gslT8t964rYXyqRcqrxFh77ikyb.jpg",
      );
}
