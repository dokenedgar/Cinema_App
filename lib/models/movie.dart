class Movie {
  final int id;
  final String title;
  final int duration;
  final int rating;
  final String imageMedium;
  final String imageLarge;
  final List<String> genre;
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
}
