import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/service/web_service.dart';
import 'package:flutter/material.dart';

class MoviesList with ChangeNotifier {
  List<Movie> movies = <Movie>[];

  Future<void> getMovies () async {
    final List<Movie> results = await WebService().getMovies();
    updateMovies(results);
  }

  void updateMovies (List<Movie> newMovies) {
    movies = newMovies;
    notifyListeners();
  }
}