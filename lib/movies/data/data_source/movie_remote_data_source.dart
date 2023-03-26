import 'package:dio/dio.dart';
import 'package:untitled1/app/errors/error_message_model.dart';
import 'package:untitled1/app/errors/exceptions.dart';
import 'package:untitled1/movies/data/models/movie_details_model.dart';
import 'package:untitled1/movies/data/models/movie_model.dart';
import 'package:untitled1/movies/data/models/movie_recommendation_model.dart';
import 'package:untitled1/movies/domain/use_cases/get_recommendation_movie_use_case.dart';

import 'package:untitled1/movies/domain/use_cases/movie_details_use_case.dart';

import '../../../app/network_constance/network_constance.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getPlayingNowMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);

  Future<List<MovieRecommendationModel>> getRecommendationsMovies(
      RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPlayingNowMovies() async {
    final response = await Dio().get(NetworkConstance.moviesNowPlaying);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'])
          .toList()
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(NetworkConstance.moviesPopular);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'])
          .toList()
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(NetworkConstance.moviesTopRated);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].toList().map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final response =
        await Dio().get(NetworkConstance.movieDetailsUrl(parameter.movieId));
    print('tessst ${response.data}');

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getRecommendationsMovies(
      RecommendationParameter parameter) async {
    final response =
        await Dio().get(NetworkConstance.movieRecommendationsUrl(parameter.id));
    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from((response.data['results'])
          .toList()
          .map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
