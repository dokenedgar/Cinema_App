class Movie {
  final int id;
  final String title;
  final int duration;
  final dynamic rating;
  final String imageMedium;
  final String imageLarge;
  final List<dynamic> genre;
  final int year;
  final String synopsis;
  final String mpaRating;
  final String trailerCode;

  Movie({
    required this.id,
    required this.title,
    required this.duration,
    required this.rating,
    required this.imageMedium,
    required this.imageLarge,
    required this.genre,
    required this.year,
    required this.mpaRating,
    required this.synopsis,
    required this.trailerCode,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      duration: json['runtime'],
      rating: json['rating'],
      imageMedium: json['medium_cover_image'],
      imageLarge: json['large_cover_image'],
      genre: json['genres'],
      year: json['year'],
      mpaRating: json['mpa_rating'],
      synopsis: json['synopsis'],
      trailerCode: json['yt_trailer_code'],
    );
  }
}
