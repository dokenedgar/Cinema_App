import 'package:cinema_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class ShowTime extends StatefulWidget {
  const ShowTime({Key? key}) : super(key: key);

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  List<String> moviePosters = [
    'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg',
  ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'December 20',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'December 21',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'December 22',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'December 23',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'December 24',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[0],
                      ),
                      MovieCard(
                        posterUrl: moviePosters[1],
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
