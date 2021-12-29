import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/purchased_ticket.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {

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
              left: 24,
              right: 24,
            ),
            child: moviesList.movies.isEmpty ? const Center(child: Text('Loading'),) : Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'Today\'s Tickets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                PurchasedTicket(movie: moviesList.movies[0],),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    'Upcoming Tickets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                PurchasedTicket(movie: moviesList.movies[2],),
                PurchasedTicket(movie: moviesList.movies[3],),
                PurchasedTicket(movie: moviesList.movies[6],),
                PurchasedTicket(movie: moviesList.movies[8],),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
