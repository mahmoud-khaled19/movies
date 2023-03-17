// https://api.themoviedb.org/3/movie/now_playing?api_key=
class NetworkConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String baseApi = 'api_key=53f1fe8c276e1633cfa4309a89f8bd60';
  static const String moviesNowPlaying = '$baseUrl/now_playing?$baseApi';
  static const String moviesTopRated = '$baseUrl/top_rated?$baseApi';
  static const String moviesPopular = '$baseUrl/popular?$baseApi';
}
