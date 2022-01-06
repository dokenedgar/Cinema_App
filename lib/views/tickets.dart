import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/purchased_ticket.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
            padding: EdgeInsets.only(
              bottom: 5.w,
              left: 6.w,
              right: 6.w,
            ),
            child: moviesList.movies.isEmpty ? const Center(child: Text('Loading'),) : Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.w, top: 4.w),
                  child: Text(
                    'Today\'s Tickets',
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                PurchasedTicket(movie: moviesList.movies[0],),
                 Padding(
                  padding: EdgeInsets.only(bottom: 2.w, top: 4.w),
                  child: Text(
                    'Upcoming Tickets',
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
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
