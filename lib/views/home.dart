import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/genre.dart';
import 'package:cinema_app/widgets/movie_card_home_screen.dart';
import 'package:cinema_app/widgets/shimmer_genres_loading.dart';
import 'package:cinema_app/widgets/shimmer_home_carousel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String selectedGenre;
  MoviesList originalMoviesList = MoviesList();
  List<Movie> mvList = <Movie>[];
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    originalMoviesList.addListener(() {
      setState(() {
        mvList = originalMoviesList.movies;
      });
      print('val change... ${originalMoviesList.movies.length}');
    });
    originalMoviesList.getMovies();
    selectedGenre = 'none';
    super.initState();
  }

  void setGenre(String clickedGenre) {
    if (selectedGenre == clickedGenre) {
      setState(() {
        _carouselController.animateToPage(0);
        mvList = originalMoviesList.movies;
        selectedGenre = 'none';
      });
    } else {
      List<Movie> tempMovies = <Movie>[];
      for (var movie in originalMoviesList.movies) {
        if (movie.genre.contains(clickedGenre)) {
          tempMovies.add(movie);
        }
      }
      setState(() {
        mvList = tempMovies;
        _carouselController.animateToPage(0);
        selectedGenre = clickedGenre;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //systemOverlayStyle: SystemUiOverlayStyle.dark,
      //   title: const Text('Home'),
      //),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.w, left: 4.w, right: 4.w),
                child: const ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'Hey, Kim Jong Un',
                  ),
                  subtitle: Text('Today, 13 December'),
                  trailing: Icon(
                    Icons.notifications,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 2.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Movie search'),
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 6.w, bottom: 2.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Categories',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  top: 2.w,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: originalMoviesList.movies.isEmpty
                      ? const ShimmerGenresLoading()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            originalMoviesList.genres.length,
                            (index) => InkWell(
                              child: Genre(
                                title: originalMoviesList.genres[index],
                                selectedGenre: selectedGenre,
                              ),
                              onTap: () {
                                setGenre(originalMoviesList.genres[index]);
                              },
                            ),
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  top: 8.w,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Popular',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.w),
                child: originalMoviesList.movies.isEmpty
                    ? const ShimmerHomeLoading()
                    : CarouselSlider(
                        carouselController: _carouselController,
                        items: List.generate(
                          mvList.length,
                          (index) => MovieCardHomeScreen(movie: mvList[index]),
                        ),
                        options: CarouselOptions(
                          aspectRatio: 0.92,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 1,
                          //onPageChanged: (index, reason) {},
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
