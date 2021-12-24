import 'dart:convert';

import 'package:cinema_app/models/movie.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<dynamic> getMovies() async {
    const url = 'https://yts.mx/api/v2/list_movies.json';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          jsonDecode(response.body); // as Map<String, dynamic>;
      final Iterable movies = jsonResponse['data']['movies'];
      print(movies.length);
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('status is not 200');
    }
  }
}
