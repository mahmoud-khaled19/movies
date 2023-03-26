class MovieDetails {
  final String title;
  final String image;
  final String releaseDate;
  final String overView;
  final int movieTime;
  final int id;
  final double voteAverage;
  final List<Genres> genres;

// finish model begin in repository and useCases

  const MovieDetails({
    required this.title,
    required this.id,
    required this.image,
    required this.releaseDate,
    required this.movieTime,
    required this.voteAverage,
    required this.overView,
    required this.genres,
  });
}

class Genres {
  final String name;
  final int id;

  const Genres({
    required this.name,
    required this.id,
  });
}
