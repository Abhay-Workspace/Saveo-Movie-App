class Movie {
  Movie({
    this.id,
    this.name,
    this.censorRating,
    this.synopsis,
    this.image,
    this.genre,
    this.rating,
    this.releaseDate,
    this.duration,
    this.criticsCount,
    this.userCount,
  });

  String id;
  String name;
  String censorRating;
  String synopsis;
  String image;
  List<String> genre;
  double rating;
  DateTime releaseDate;
  Duration duration;
  int criticsCount;
  int userCount;
}
