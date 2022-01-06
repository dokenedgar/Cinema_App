import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
            padding:  EdgeInsets.only(
              bottom: 5.w,
              left: 4.w,
              right: 4.w,
            ),
            child: moviesList.movies.isEmpty
                ? const Center(
                    child: Text('Loading...'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 2.w, top: 4.w),
                        child: Text(
                          'January 5',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                       Padding(
                        padding:  EdgeInsets.only(bottom: 2.w, top: 4.w),
                        child: Text(
                          'January 6',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                       Padding(
                        padding: EdgeInsets.only(bottom: 2.w, top: 4.w),
                        child: Text(
                          'January 7',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                       Padding(
                        padding:  EdgeInsets.only(bottom: 2.w, top: 4.w),
                        child: Text(
                          'January 8',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                       Padding(
                        padding:  EdgeInsets.only(bottom: 2.w, top: 4.w),
                        child: Text(
                          'January 9',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
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
