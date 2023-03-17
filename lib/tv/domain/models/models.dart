// onBoarding Model
class PageObject {
  final String title;
  final String subTitle;
  final String image;

  PageObject(this.title, this.subTitle, this.image);
}

class Movie {
  final int id;
  final String title;
  final String image;
  final List<int> genderIds;
  final String description;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.genderIds,
    required this.description,
    required this.voteAverage,
  });

// factory Movie.fromJson(Map<String,dynamic>json)=>
//    Movie(id: json['id'],
//        title: title,
//        image: image,
//        genderIds: genderIds,
//        description: description,
//        voteAverage: voteAverage)
}
