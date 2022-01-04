import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/service/web_service.dart';
import 'package:flutter/material.dart';

class MoviesList with ChangeNotifier {
  List<Movie> movies = <Movie>[];
  List<String> genres = <String>[];

  Future<void> getMovies () async {
    final List<Movie> results = await WebService().getMovies();
    updateMovies(results);
  }

  void updateMovies (List<Movie> newMovies) {
    movies = newMovies;
    for (var movie in movies) {
      if(movie.genre.isNotEmpty) {
        for(var genre in movie.genre){
          if(!genres.contains(genre)){
            genres.add(genre);
          }
        }
      }
    }
    notifyListeners();
  }
}