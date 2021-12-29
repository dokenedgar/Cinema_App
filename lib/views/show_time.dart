import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class ShowTime extends StatefulWidget {
  const ShowTime({Key? key}) : super(key: key);

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {

  MoviesList moviesList = MoviesList();

  @override
  void initState() {
   moviesList.addListener(() {
     setState(() {});
    });
    moviesList.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: kToolbarHeight,
              left: 16,
              right: 16,
            ),
            child: moviesList.movies.isEmpty
                ? const Center(
                    child: Text('Loading...'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0, top: 16),
                        child: Text(
                          'December 20',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              movie: moviesList.movies[0],
                            ),
                            MovieCard(
                              movie: moviesList.movies[1],
                            ),
                            MovieCard(
                              movie: moviesList.movies[2],
                            ),
                            MovieCard(
                              movie: moviesList.movies[3],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                        child: Text(
                          'December 21',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              movie: moviesList.movies[4],
                            ),
                            MovieCard(
                              movie: moviesList.movies[5],
                            ),
                            MovieCard(
                              movie: moviesList.movies[6],
                            ),
                            MovieCard(
                              movie: moviesList.movies[7],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                        child: Text(
                          'December 22',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              movie: moviesList.movies[8],
                            ),
                            MovieCard(
                              movie: moviesList.movies[9],
                            ),
                            MovieCard(
                              movie: moviesList.movies[10],
                            ),
                            MovieCard(
                              movie: moviesList.movies[11],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                        child: Text(
                          'December 23',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              movie: moviesList.movies[12],
                            ),
                            MovieCard(
                              movie: moviesList.movies[13],
                            ),
                            MovieCard(
                              movie: moviesList.movies[14],
                            ),
                            MovieCard(
                              movie: moviesList.movies[15],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                        child: Text(
                          'December 24',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieCard(
                              movie: moviesList.movies[16],
                            ),
                            MovieCard(
                              movie: moviesList.movies[17],
                            ),
                            MovieCard(
                              movie: moviesList.movies[18],
                            ),
                            MovieCard(
                              movie: moviesList.movies[19],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
